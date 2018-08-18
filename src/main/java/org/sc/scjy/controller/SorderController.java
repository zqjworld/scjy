package org.sc.scjy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.sc.scjy.entity.Product;
import org.sc.scjy.entity.Sorder;
import org.sc.scjy.service.ProductService;
import org.sc.scjy.service.SorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sorder")
public class SorderController {

	@Autowired
	private SorderService sorderService;
	@Autowired
	private ProductService productService;
	
	/**
	 * 添加购物车
	 */
	@RequestMapping("/addSorder")
	public void addSorder(int id,HttpServletRequest request,HttpServletResponse response){
		int bid=(Integer) request.getSession().getAttribute("userId");
		Product product=productService.selectProById(id);
		Sorder sorder=new Sorder(product.getId(),product.getPname(),product.getPpic(),product.getPprice(),product.getPcount(),product.getPstandard(),product.getPtype(),product.getUid(),bid);
		String result="{\"result\":\"error\"}";
		if(sorderService.save(sorder)){
			result="{\"result\":\"success\"}";
		}
		response.setContentType("application/json;charset=utf-8");  
        try {  
		 PrintWriter out = response.getWriter();  
		 out.write(result);  
		 } catch (IOException e) {  
		 e.printStackTrace();  
		 }  
		
	}
	/**
	 * 查看购物车
	 */
	@RequestMapping("/findAllSorder")
	public String findAllSorder(HttpServletRequest request,Model model){
		int bid=(int) request.getSession().getAttribute("userId");
		List<Sorder> sorderList=sorderService.findAllSorderByBid(bid);
		model.addAttribute("sorderList", sorderList);
		return "sorder/allSorder";
	}
	
	/**
	 * 删除购物车中的信息
	 */
	@RequestMapping("/delSorder")
	public void delSorder(int sid,HttpServletRequest request,HttpServletResponse response){
		String result="{\"result\":\"error\"}";
		if(sorderService.delete(sid)){
			result="{\"result\":\"success\"}";
		}
		response.setContentType("application/json;charset=utf-8");  
        try {  
		 PrintWriter out = response.getWriter();  
		 out.write(result);  
		 } catch (IOException e) {  
		 e.printStackTrace();  
		 }  
	}
	
	/**
	 * 根据商品名称查询购物车信息
	 */
	@RequestMapping(value="/findSorderByProName",method=RequestMethod.POST)
	public String findSorderByProName(Model model,HttpServletRequest request){
		int bid=(int) request.getSession().getAttribute("userId");
		String pname=request.getParameter("pname");
		List<Sorder> sorderList=sorderService.findSorderByProName(pname,bid);
		model.addAttribute("sorderList", sorderList);
		return "sorder/allSorder";
	}
}
