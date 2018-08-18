package org.sc.scjy.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.sc.scjy.entity.Product;
import org.sc.scjy.service.ProductService;
import org.sc.scjy.utils.IPTimeStamp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.fastjson.JSON;


@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	/**
	 * 获取所有商品
	 */
	@RequestMapping(value="/getAllProduct",method=RequestMethod.GET)
	public String getAllProduct(HttpServletRequest request,Model model){
		List<Product> productList=productService.findAll();
		model.addAttribute("productList", productList);
		request.setAttribute("productList", productList);
		return "product/allProduct";
	}
	
	/**
	 * 跳转到添加商品界面
	 */
	@RequestMapping(value="/toAddProduct",method=RequestMethod.GET)
	public String toAddProduct(){
		return "product/addProduct";
	}
	
	/**
	 * 添加商品并重定向
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	public String addProduct(Product product,@RequestParam("file") MultipartFile file,Model model,HttpServletRequest request) throws IllegalStateException, IOException{
		if(!file.getOriginalFilename().equals("")){
		String realPath=request.getSession().getServletContext().getRealPath("/upload");
			//String realPath="D:/photo";
		File pathFile=new File(realPath);
		if(!pathFile.exists()){
			//文件夹不存在，创建文件
			pathFile.mkdirs();
		}
		//将文件copy上传到服务器
		file.transferTo(new File(realPath+"/"+file.getOriginalFilename()));
		IPTimeStamp ipTimeStamp=new IPTimeStamp();
		String ext=FilenameUtils.getExtension(file.getOriginalFilename());
		String newfilename=ipTimeStamp.getTimeStamp()+"."+ext;
		FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath,newfilename));
		new File(realPath+"/"+file.getOriginalFilename()).delete();
		//获取modellandview对象
		product.setPpic(newfilename);
		}
//		SimpleDateFormat df=new SimpleDateFormat("yyyyMMdd");
//		String pDate=df.format(new Date());
		product.setPdate(new Date());
		Integer userId=(Integer) request.getSession().getAttribute("userId");
		product.setUid(userId);
		productService.save(product);
		return "redirect:/product/getAllProduct";
	}
	
	/**
	 * 编辑商品信息
	 * @throws IOException 
	 */
	@RequestMapping(value="/updateProduct")
	public String updateProduct(Product product,@RequestParam("file") MultipartFile file,HttpServletRequest request) throws IOException{
		Product oldproduct=productService.selectProById(product.getId());
		if(file.getOriginalFilename()!=null && !file.getOriginalFilename().equals("")){
			String realPath=request.getSession().getServletContext().getRealPath("/upload");
		//	String realPath="D:/photo";
			File oldfile=new File(realPath+"/"+oldproduct.getPpic());
			oldfile.delete();
			File pathFile=new File(realPath);
			if(!pathFile.exists()){
				pathFile.mkdirs();
			}
			IPTimeStamp ipTimeStamp=new IPTimeStamp();
			String ext=FilenameUtils.getExtension(file.getOriginalFilename());
			String newfilename=ipTimeStamp.getTimeStamp()+"."+ext;
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath,newfilename));
			product.setPpic(newfilename);
			
		}else if(file.getOriginalFilename()==null||"".equals(file.getOriginalFilename())){
			product.setPpic(productService.selectProById(product.getId()).getPpic());
		}
		if(productService.update(product)){
			return "redirect:/product/getAllProduct";
		}else{
			return "/error";
		}
	}
	
	
	/**
	 * 根据id查询单个商品
	 */
	@RequestMapping("/getProduct")
	public String getProduct(int id,HttpServletRequest request,HttpServletResponse response,Model model){
		request.setAttribute("product", productService.selectProById(id));
		model.addAttribute("product", productService.selectProById(id));
		return "product/editProduct";
	}
	
	/**
	 * 删除商品
	 */
	@RequestMapping("/delProduct")
	public void delProduct(int id,String ppic,HttpServletRequest request,HttpServletResponse response){
		String result="{\"result\":\"error\"}";
		if(productService.delete(id)){
			String realPath=request.getSession().getServletContext().getRealPath("/upload");
			//String realPath="D:/photo";
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
	
	/**
	 * 根据商品名称模糊查询
	 */
	@RequestMapping(value="/findProductByproName",method=RequestMethod.POST)
	public String findProductByproName(String pname,Model model){
		List<Product> productList=productService.findProductByproName(pname);
		model.addAttribute("productList",productList);
		return "product/allProduct";
	}
	
	/**
	 * 根据用户id查询商品
	 */
/*	@RequestMapping("/findProductByUid")
	public String findProductByUid(String uid,Model model){
		List<Product> productList=productService.findProductByUid(uid);
		model.addAttribute("productList", productList);
		return "product/allProduct";
	}*/
	
	/**
	 * 根据商品类型加载不同商品
	 */
	@RequestMapping(value="/findProductByPtype/{ptype}")
	public String findProductByPtype(@PathVariable("ptype") String ptype,Model model){
		List<Product> productList=productService.findProductByPtype(ptype);
		model.addAttribute("productList", productList);
		return "product/allProduct";
	}

	
	/**
	 * 显示最新商品
	 */
	@RequestMapping(value="/frontList")
	public String frontList(Model model,HttpServletRequest request){
		List<Product> newList=productService.findProNew();
		model.addAttribute("newList",newList);
		request.setAttribute("newList", newList);
		return "index";
		
	}
	
	/**
	 * 获取商品detail
	 */
	@RequestMapping("/getProductDetail")
	public String getProductDetail(int id,HttpServletRequest request,Model model){
		request.setAttribute("product", productService.selectProById(id));
		model.addAttribute("product", productService.selectProById(id));
		return "product/productDetail";
	}
	
	/**
	 * 查看我发布的商品
	 */
	@RequestMapping("/findProductByUid")
	public String findProductByUid(HttpServletRequest request,Model model){
		Integer userId=(Integer) request.getSession().getAttribute("userId");
		List<Product> productList=productService.findProductByUid(userId);
		model.addAttribute("productList", productList);
		request.setAttribute("productList", productList);
		return "product/allProduct";
	}
	
	/**
	 * 跳转到商品详情页
	 */
	@RequestMapping("/productDetail")
	public String productDetail(int id,HttpServletRequest request,Model model){
		request.setAttribute("product", productService.selectProById(id));
		model.addAttribute("product", productService.selectProById(id));
		return "product/productDetail";
	}
	
	/**
	 * 查询商品
	 */
	@RequestMapping("/checkProduct")
	public void checkProduct(String pname,HttpServletRequest request,HttpServletResponse response){
		String result="{\"result\":\"error\"}";
		Product product=new Product();
		product=productService.checkProName(pname);
		System.out.println(product);
		if(product==null){
		//if(productService.checkProName(pname)){
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
	 * 获取商品名称
	 */
	@RequestMapping("/getProName")
	public void getProName(HttpServletResponse response) {
		List<HashMap<String, String>> proNameList = productService.getProName();
		response.setContentType("application/json;charset=utf-8");
		String listJson = JSON.toJSONString(proNameList);
		try {
			PrintWriter out = response.getWriter();
			out.write(listJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 */
	@RequestMapping("/getProCount")
	public void getProCount(HttpServletResponse response){
		List<HashMap<String,String>> proList=productService.getProCount();
		response.setContentType("application/json;charset=utf-8");
		String listJson = JSON.toJSONString(proList);
		try {
			PrintWriter out = response.getWriter();
			out.write(listJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
