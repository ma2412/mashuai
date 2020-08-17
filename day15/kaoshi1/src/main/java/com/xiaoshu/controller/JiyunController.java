package com.xiaoshu.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.xiaoshu.config.util.ConfigUtil;
import com.xiaoshu.dao.jiyunBankMapper;
import com.xiaoshu.dao.jiyunPersonMapper;
import com.xiaoshu.entity.Attachment;
import com.xiaoshu.entity.Log;
import com.xiaoshu.entity.Operation;
import com.xiaoshu.entity.Role;
import com.xiaoshu.entity.User;
import com.xiaoshu.entity.jiyunBank;
import com.xiaoshu.entity.jiyunPerson;
import com.xiaoshu.service.JiyunService;
import com.xiaoshu.service.OperationService;
import com.xiaoshu.service.RoleService;
import com.xiaoshu.service.UserService;
import com.xiaoshu.util.StringUtil;
import com.xiaoshu.util.TimeUtil;
import com.xiaoshu.util.WriterUtil;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("jiyun")
public class JiyunController extends LogController{
	static Logger logger = Logger.getLogger(JiyunController.class);

	@Autowired
	private UserService userService;
	
	
	@Autowired
	private JiyunService jiyunService;
	
	@Autowired
	private RoleService roleService ;
	
	@Autowired
	private OperationService operationService;
	
	
	@RequestMapping("jiyunIndex")
	public String index(HttpServletRequest request,Integer menuid) throws Exception{
		List<Role> roleList = roleService.findRole(new Role());
		List<Operation> operationList = operationService.findOperationIdsByMenuid(menuid);
		List<jiyunBank> blist = jiyunService.findb();
		request.setAttribute("blist", blist);
		request.setAttribute("operationList", operationList);
		request.setAttribute("roleList", roleList);
		return "jiyun";
	}
	
	
	@RequestMapping(value="userList",method=RequestMethod.POST)
	public void userList(jiyunPerson person,HttpServletRequest request,HttpServletResponse response,String offset,String limit) throws Exception{
		try {
			
			Integer pageSize = StringUtil.isEmpty(limit)?ConfigUtil.getPageSize():Integer.parseInt(limit);
			Integer pageNum =  (Integer.parseInt(offset)/pageSize)+1;
			PageInfo<jiyunPerson> userList= jiyunService.findAll(person,pageNum,pageSize);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("total",userList.getTotal() );
			jsonObj.put("rows", userList.getList());
	        WriterUtil.write(response,jsonObj.toString());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("用户展示错误",e);
			throw e;
		}
	}
	
	
	// 新增或修改
	@RequestMapping("reserveUser")
	public void reserveUser(jiyunPerson person,HttpServletRequest request,HttpServletResponse response){
		Integer userId = person.getpId();
		JSONObject result=new JSONObject();
		try {
			if (userId != null) {   // userId不为空 说明是修改
					jiyunService.updateUser(person);
					result.put("success", true);
			}else {   // 添加
				if(jiyunService.existUserWithUserName(person.getpName())==null){  // 没有重复可以添加
					jiyunService.addUser(person);
					result.put("success", true);
				} else {
					result.put("success", true);
					result.put("errorMsg", "该用户名被使用");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("保存用户信息错误",e);
			result.put("success", true);
			result.put("errorMsg", "对不起，操作失败");
		}
		WriterUtil.write(response, result.toString());
	}
	// 新增或修改
	@RequestMapping("addtemp")
	public void addtemp(jiyunBank bank,HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
					jiyunService.addtemp(bank);
					result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("保存用户信息错误",e);
			result.put("success", true);
			result.put("errorMsg", "对不起，操作失败");
		}
		WriterUtil.write(response, result.toString());
	}
	//exportaaa
	/**
	 * 备份
	 */
	@RequestMapping("exportaaa")
	public void exportaaa(jiyunPerson person,HttpServletRequest request,HttpServletResponse response){
		JSONObject result = new JSONObject();
		try {
			String time = TimeUtil.formatTime(new Date(), "yyyyMMddHHmmss");
		    String excelName = "手动备份"+time;
			List<jiyunPerson> list = jiyunService.findLog(person);
			String[] handers = {"人员编号","人员姓名","人员性别","人员爱好","存款金额","人员年龄","存款日期","存款银行"};
			// 1导入硬盘
			ExportExcelToDisk(request,response,handers,list, excelName);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("", "对不起，备份失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	// 导出到硬盘
	@SuppressWarnings("resource")
	private void ExportExcelToDisk(HttpServletRequest request,HttpServletResponse response,
			String[] handers, List<jiyunPerson> list, String excleName) throws Exception {
		
		try {
			HSSFWorkbook wb = new HSSFWorkbook();//创建工作簿
			HSSFSheet sheet = wb.createSheet("操作记录备份");//第一个sheet
			HSSFRow rowFirst = sheet.createRow(0);//第一个sheet第一行为标题
			rowFirst.setHeight((short) 500);
			for (int i = 0; i < handers.length; i++) {
				sheet.setColumnWidth((short) i, (short) 4000);// 设置列宽
			}
			//写标题了
			for (int i = 0; i < handers.length; i++) {
			    //获取第一行的每一个单元格
			    HSSFCell cell = rowFirst.createCell(i);
			    //往单元格里面写入值
			    cell.setCellValue(handers[i]);
			}
			for (int i = 0;i < list.size(); i++) {
			    //获取list里面存在是数据集对象
				jiyunPerson log = list.get(i);
			    //创建数据行
			    HSSFRow row = sheet.createRow(i+1);
			    //设置对应单元格的值
			    row.setHeight((short)400);   // 设置每行的高度
			    // {"人员编号","人员姓名","人员性别","人员爱好","存款金额","人员年龄","存款日期","存款银行"};
			    row.createCell(0).setCellValue(i+1);
			    row.createCell(1).setCellValue(log.getpName());
			    row.createCell(2).setCellValue(log.getpSex());
			    row.createCell(3).setCellValue(log.getpLike());
			    row.createCell(4).setCellValue(log.getpCount());
			    row.createCell(5).setCellValue(log.getpAge());
			    row.createCell(6).setCellValue(TimeUtil.formatTime(log.getCreatetime(), "yyyy-MM-dd"));
			    row.createCell(7).setCellValue(log.getBname());
			}
			//写出文件（path为文件路径含文件名）
				OutputStream os;
				File file = new File("f:/pic/"+excleName+".xls");
				
				if (!file.exists()){//若此目录不存在，则创建之  
					file.createNewFile();  
					logger.debug("创建文件夹路径为："+ file.getPath());  
	            } 
				os = new FileOutputStream(file);
				wb.write(os);
				os.close();
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
	}
	
	@RequestMapping("deleteUser")
	public void delUser(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				jiyunService.deleteUser(Integer.parseInt(id));
			}
			result.put("success", true);
			result.put("delNums", ids.length);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除用户信息错误",e);
			result.put("errorMsg", "对不起，删除失败");
		}
		WriterUtil.write(response, result.toString());
	}
	@RequestMapping("getEcharts")
	public void getEcharts(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			List<jiyunPerson> elist = jiyunService.getEcharts();
			result.put("elist", elist);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除用户信息错误",e);
			result.put("errorMsg", "对不起，删除失败");
		}
		WriterUtil.write(response, result.toString());
	}
	@RequestMapping("importJy")
	public void importJy(MultipartFile Excal,HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			HSSFWorkbook book = new HSSFWorkbook(Excal.getInputStream());
			HSSFSheet sheetAt = book.getSheetAt(0);
			int lastRowNum = sheetAt.getLastRowNum();
			for (int i = 1; i <= lastRowNum; i++) {
				HSSFRow row = sheetAt.getRow(i);
				String pName = row.getCell(0).getStringCellValue();
				String pSex = row.getCell(1).getStringCellValue();
				String pLike = row.getCell(2).getStringCellValue();
				String pCount = row.getCell(3).getStringCellValue();
				String pAge = row.getCell(4).getStringCellValue();
				Date createtime = row.getCell(5).getDateCellValue();
				String bname = row.getCell(6).getStringCellValue();
				Integer bId = NameById(bname);
				jiyunPerson person = new jiyunPerson();
				person.setpName(pName);
				person.setpSex(pSex);
				person.setpLike(pLike);
				person.setpCount(pCount);
				person.setpAge(pAge);
				person.setCreatetime(createtime);
				person.setbId(bId);
				jiyunService.addUser(person);
			}
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除用户信息错误",e);
			result.put("errorMsg", "对不起，删除失败");
		}
		WriterUtil.write(response, result.toString());
	}
	@Autowired
	private jiyunBankMapper BankMapper;
	private Integer NameById(String bname) {
		jiyunBank bank = new jiyunBank();
		bank.setbName(bname);
		jiyunBank one = BankMapper.selectOne(bank);
		return one.getbId();
	}


	@RequestMapping("editPassword")
	public void editPassword(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		if(currentUser.getPassword().equals(oldpassword)){
			User user = new User();
			user.setUserid(currentUser.getUserid());
			user.setPassword(newpassword);
			try {
				userService.updateUser(user);
				currentUser.setPassword(newpassword);
				session.removeAttribute("currentUser"); 
				session.setAttribute("currentUser", currentUser);
				result.put("success", true);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("修改密码错误",e);
				result.put("errorMsg", "对不起，修改密码失败");
			}
		}else{
			logger.error(currentUser.getUsername()+"修改密码时原密码输入错误！");
			result.put("errorMsg", "对不起，原密码输入错误！");
		}
		WriterUtil.write(response, result.toString());
	}
}
