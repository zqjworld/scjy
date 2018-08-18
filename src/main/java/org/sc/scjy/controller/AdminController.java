package org.sc.scjy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.sc.scjy.entity.Admin;
import org.sc.scjy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	/**
	 * 管理员登录
	 */
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(HttpSession session){
		
		if(session.getAttribute("admin_name")==null ){
			
			session.setAttribute("msg", "用户还没有登录");
			
			return "admin/login";
		}
		
		return "admin/background";
	} 
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String tologin(){
		
		return "admin/login";
	}
	
	
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(Admin admin,HttpSession session){
		try {
			Admin existadmin = adminService.login(admin.getAdminName(), admin.getAdminPass());
			session.setAttribute("userId", existadmin.getId());
			session.setAttribute("admin_name", existadmin.getAdminName());
			
			session.removeAttribute("msg");
			session.setAttribute("userType", 1);
			return "redirect:/admin/";
		
		} catch (Exception e) {
			
			session.setAttribute("msg", "用户或密码错误");
		}
		
		return "redirect:/admin/login";
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(Admin admin,HttpSession session){
	
			
		session.removeAttribute("admin_name");
		
		return "redirect:/admin/login";
	}
	
	
	
	
	
	/**
	 * 获取所有管理员
	 */
	@RequestMapping("/getAllAdmin")
	public String getAllAdmin(HttpServletRequest request,Model model){
		List<Admin> adminList=adminService.findAll();
		model.addAttribute("adminList", adminList);
		request.setAttribute("adminList", adminList);
		return "admin/allAdmin";
	}
	/**
	 * 跳转到添加管理员界面
	 */
	@RequestMapping("/toAddAdmin")
	public String toAddAdmin(){
		return "admin/addAdmin";
	}
	
	/**
	 * 添加管理员并重定向
	 */
	@RequestMapping("/addAdmin")
	public String addAdmin(Admin admin,Model model){
		adminService.save(admin);
		return "redirect:/admin/getAllAdmin";
	}
	
	/**
	 * 编辑管理员
	 */
	@RequestMapping("/updateAdmin")
	public String updateAdmin(Admin admin,Model model){
		if(adminService.update(admin)){
			return "redirect:/admin/getAllAdmin";
		}else{
			return "/error";
		}
		
	}
	
	/**
	 * 根据id查询单个管理员
	 */
	@RequestMapping("/getAdmin")
	public String getAdmin(int id,HttpServletRequest request,Model model){
		request.setAttribute("admin", adminService.selectAdminById(id));
		model.addAttribute("admin",adminService.selectAdminById(id));
		return "admin/editAdmin";
	}
	
	/**
	 * 删除管理员
	 */
	@RequestMapping("/delAdmin")
	public void delAdmin(int id,HttpServletRequest request,HttpServletResponse response){
		String result="{\"result\":\"error\"}";
		//System.out.println(userId);
		if(adminService.delete(id)){
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
	/**
	 * 模糊查询管理员
	 */
	@RequestMapping(value="/findAdminByadminName",method=RequestMethod.POST)
	public String findAdminByAdminName(String adminName,Model model){
		List<Admin> adminList=adminService.findAdminByAdminName(adminName);
		model.addAttribute("adminList", adminList);
		return "admin/allAdmin";
	}
	
}
