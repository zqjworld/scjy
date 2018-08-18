package org.sc.scjy.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.sc.scjy.entity.Forder;
import org.sc.scjy.entity.Product;
import org.sc.scjy.entity.Sorder;
import org.sc.scjy.entity.User;
import org.sc.scjy.service.ForderService;
import org.sc.scjy.service.ProductService;
import org.sc.scjy.service.SorderService;
import org.sc.scjy.service.UserService;
import org.sc.scjy.utils.mail.SendMailDemo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping("/forder")
public class ForderController {

	@Autowired
	private ForderService forderService;
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;
	@Autowired
	private SorderService sorderService;
	
	@RequestMapping("/addForder")
	public void addForder(int sid,Model model,HttpServletResponse response){
		Sorder sorder=sorderService.findSorderBysid(sid);
		User bUser=userService.selectUserById(sorder.getBid());
		User sUser=userService.selectUserById(sorder.getSuid());
		Forder forder=new Forder(sorder.getPid(),sorder.getPname(),sorder.getPcount(),sorder.getPstandard(),sorder.getPprice(),sorder.getPtype(),sorder.getPpic(), bUser.getId(),bUser.getUsername(),bUser.getTel(),bUser.getWxaccount(),sUser.getId(),sUser.getUsername(),sUser.getTel(),sUser.getWxaccount(),sUser.getAddress(),new Date());
		String result="{\"result\":\"error\"}";
		if(forderService.save(forder)){
			if(sorderService.delete(sid) && productService.delete(sorder.getPid())){
				result="{\"result\":\"success\"}";
				SendMailDemo.sendEmail("sdzhangqingjun@163.com", "Zqj0612", bUser.getEmail(), "您的订单已提交，请登录系统查看");
				SendMailDemo.sendEmail("sdzhangqingjun@163.com", "Zqj0612", sUser.getEmail(), "您的商品交易成功，请登录系统查看");
				
			}
		}
		response.setContentType("application/json");  
        try {  
		 PrintWriter out = response.getWriter();  
		 out.write(result);  
		 } catch (IOException e) {  
		 e.printStackTrace();  
		 }
	}
	
	@RequestMapping("/addForderfrompid")
	public void addForderfrompid(int pid,int uid,Model model,HttpServletRequest request,HttpServletResponse response){
		int bid=(int) request.getSession().getAttribute("userId");
		User bUser=userService.selectUserById(bid);
		User sUser=userService.selectUserById(uid);
		Product product=productService.selectProById(pid);
		Forder forder=new Forder(pid,product.getPname(),product.getPcount(),product.getPstandard(),product.getPprice(),product.getPtype(),product.getPpic(),bid,bUser.getUsername(),bUser.getTel(),bUser.getWxaccount(),sUser.getId(),sUser.getUsername(),sUser.getTel(),sUser.getWxaccount(),sUser.getAddress(),new Date());
		String result="{\"result\":\"error\"}";
		if(forderService.save(forder)){
			if(productService.delete(pid)){
				SendMailDemo.sendEmail("sdzhangqingjun@163.com", "Zqj0612", bUser.getEmail(), "您的订单被提交，请登录系统查看");
				SendMailDemo.sendEmail("sdzhangqingjun@163.com", "Zqj0612", sUser.getEmail(), "您的订单被提交，请登录系统查看");
				result="{\"result\":\"success\"}";
			}
		}
		response.setContentType("application/json");  
        try {  
		 PrintWriter out = response.getWriter();  
		 out.write(result);  
		 } catch (IOException e) {  
		 e.printStackTrace();  
		 }
	}
	
	@RequestMapping("/findAllForderBybid")
	public String findAllForderBybid(Model model,HttpServletRequest request){
		Integer bid=(Integer) request.getSession().getAttribute("userId");
		List<Forder> forderList=forderService.findAllForderBybid(bid);
		model.addAttribute("forderList", forderList);
		return "forder/allForder";
	}
	
	@RequestMapping("/findForderByProName")
	public String findForderByProName(String pname,Model model,HttpServletRequest request){
		Integer bid=(Integer) request.getSession().getAttribute("userId");
		List<Forder> forderList=forderService.findAllForderBypName(pname,bid);
		model.addAttribute("forderList", forderList);
		return "forder/allForder";
	}
	
	@RequestMapping("/findForderByfId")
	public String findForderByfId(@RequestParam("fid") int fid,HttpServletRequest request,Model model){
		Forder forder=forderService.selectForderByfid(fid);
		request.setAttribute("forder", forder);
		model.addAttribute("forder", forder);
		return "forder/forderDetail";
	}
	
	@RequestMapping("/delForder")
	public void delForder(int fid,String ppic,HttpServletRequest request,HttpServletResponse response){
		String result="{\"result\":\"error\"}";
		if(forderService.delete(fid)){
			String realPath=request.getSession().getServletContext().getRealPath("/upload");
			File oldFile=new File(realPath+"/"+ppic);
			oldFile.delete();
			result="{\"result\":\"success\"}";
		}
		 response.setContentType("application/json");  
         try {  
		 PrintWriter out = response.getWriter();  
		 out.write(result);  
		 } catch (IOException e) {  
		 e.printStackTrace();  
		 }  
	}
	@RequestMapping("/findAllForder")
	public String findAllForder(Model model,HttpServletRequest request){
		List<Forder> forderList=forderService.findAllForder();
		model.addAttribute("forderList", forderList);
		return "forder/allForder";
	}
	/**
	 * 获取各校区订单数量
	 */
	@RequestMapping("/getForderCount")
	public void getForderCount(HttpServletResponse response){
		List<HashMap<String, String>> forderList=forderService.getForderCount();
		response.setContentType("application/json");
		String listJson = JSON.toJSONString(forderList);
		try {
			PrintWriter out = response.getWriter();
			out.write(listJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取各校区订单数量折线
	 */
	@RequestMapping("/getForderCountZ")
	public void getForderCountZ(HttpServletResponse response){
		List<HashMap<String, String>> forderList=forderService.getForderCountZ();
		response.setContentType("application/json");
		String listJson = JSON.toJSONString(forderList);
		try {
			PrintWriter out = response.getWriter();
			out.write(listJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
