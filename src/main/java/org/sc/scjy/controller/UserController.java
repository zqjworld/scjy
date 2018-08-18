package org.sc.scjy.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.sc.scjy.entity.User;
import org.sc.scjy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;



@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	/**
	 * 跳转到用户登录
	 */
	@RequestMapping(value="/tologin",method=RequestMethod.GET)
	public String tologin(){
		return "redirect:/jsp/user/user_login.jsp";
	}
	
	/**
	 * 用户登录
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User user,Model model,HttpServletRequest request){
		User existuser=userService.login(user);
		if(existuser==null){
			model.addAttribute("msg","用户名或密码错误");
			return "forward:/jsp/user/user_login.jsp";
		}
		request.getSession().setAttribute("userId", existuser.getId());
		request.getSession().setAttribute("userName", existuser.getUsername());
		request.getSession().setAttribute("userType", 2);
		return "redirect:/product/frontList";
	}
	
	/**
	 * 跳转到用户注册界面
	 */
	@RequestMapping(value="/toregister",method=RequestMethod.GET)
	public String toregister(){
		
		return "redirect:/jsp/user/user_register.jsp";
	}
	
	/**
	 * 用户注册
	 */
	@RequestMapping(value="/registerUser",method=RequestMethod.POST)
	public String registerUser(User user,Model model){
		userService.save(user);
		return "redirect:/user/tologin";
	}
	
	/**
	 * 获取所有用户
	 */
	@RequestMapping("/getAllUser")
	public String getAllUser(HttpServletRequest request,Model model){
		List<User> userList=userService.findAll();
		model.addAttribute("userList",userList);
		request.setAttribute("userList", userList);
		return "user/allUser";
	}
	
	/**
	 * 注销用户
	 */
	@RequestMapping("/loginout")
	public String loginout(HttpServletRequest request){
		request.getSession().removeAttribute("userId");
		request.getSession().removeAttribute("userName");
		return "redirect:/product/frontList";
	}
	
	/**
	 * 跳转到添加用户界面
	 */
	@RequestMapping("/toAddUser")
	public String toAddUser(){
		return "user/addUser";
	}
	
	/**
	 * 添加用户并重定向
	 */
	@RequestMapping("/addUser")
	public String addUser(User user,Model model){
		userService.save(user);
		return "redirect:/user/getAllUser";
	}
	
	/**
	 * 编辑用户信息
	 */
	@RequestMapping("/updateUser")
	public String updateUser(User user,Model model,HttpServletRequest request){
		int userId=(int) request.getSession().getAttribute("userId");
		if(userService.update(user)){
			if(userId==user.getId()){
				return "/user/userDetail";
			}else{
				
				return "redirect:/user/getAllUser";
			}
		}else{
			return "/error";
		}
	}
	/**
	 * 根据id查询单个管理员
	 */
	@RequestMapping("/getUser")
	public String getUser(int id,HttpServletRequest request,Model model){
		User user=userService.selectUserById(id);
		request.setAttribute("user", user);
		model.addAttribute("user", user);
		return "user/editUser";
		
	}
	/**
	 * 删除用户
	 */
	@RequestMapping("/delUser")
	public void delUser(int id,HttpServletRequest request,HttpServletResponse response){
		String result="{\"result\":\"error\"}";
		if(userService.delete(id)){
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
	 * 模糊查询用户名
	 */
	@RequestMapping(value="/findUserByuserName",method=RequestMethod.POST)
	public String findUserByuserName(String username,Model model){
		List<User> userList=userService.findUserByuserName(username);
		model.addAttribute("userList",userList);
		return "user/allUser";
	}
	
	/**
	 * 跳转到个人信息
	 */
	@RequestMapping("/userDetail")
	public String userDetail(HttpServletRequest request,Model model){
		int id=(int) request.getSession().getAttribute("userId");
		request.setAttribute("user", userService.selectUserById(id));
		model.addAttribute("user", userService.selectUserById(id));
		return "user/userDetail";
	}
	
	/**
	 * 查询用户名是否重复
	 */
	@RequestMapping("/checkUserName")
	public void checkUserName(String username,HttpServletRequest request,HttpServletResponse response){
		String result="{\"result\":\"error\"}";
		User user=userService.checkUserName(username);
		System.out.println(user);
		if(user==null){
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
	 * 各校区用户数量进行统计
	 */
	@RequestMapping("/getUserCount")
	public void getUserCount(HttpServletResponse response){
		List<HashMap<String, String>> userList=userService.getUserCount();
		response.setContentType("application/json;charset=utf-8");
		String listJson = JSON.toJSONString(userList);
		try {
			PrintWriter out = response.getWriter();
			out.write(listJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
