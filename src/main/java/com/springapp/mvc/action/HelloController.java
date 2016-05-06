package com.springapp.mvc.action;

import com.springapp.mvc.biz.AdminBiz;
import com.springapp.mvc.biz.SerarchManager;
import com.springapp.mvc.biz.TeacherManager;
import com.springapp.mvc.biz.WordFileBiz;
import com.springapp.mvc.domain.Teacher;
import com.springapp.mvc.domain.TeacherInfo;
import com.springapp.mvc.domain.WordsFile;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping(value = "/")
public class HelloController {
	@Autowired
	private SerarchManager serarchManager;
	@Autowired
	private TeacherManager teacherManager;
	@Autowired
	private WordFileBiz wordFileBiz;
	@Autowired
	private AdminBiz adminBiz;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String printWelcome(HttpServletRequest httpServletRequest, HttpServletResponse response,ModelMap model) {

		return "/wordlibrary/login";
	}
	@RequestMapping(value = "/hello")
	public String printName(HttpServletRequest httpServletRequest, HttpServletResponse response,ModelMap model){
		String name =httpServletRequest.getParameter("name");

		Teacher teacher=serarchManager.teacherHandle(name);
		if (teacher==null)
			return exception("null");
		model.addAttribute("teacher", teacher);
		model.addAttribute("message", "teacher");
		return "hello";
	}
	@RequestMapping(value = "/showteacher/{name}")
	public String showTeacherInfo(@PathVariable("name") String name,HttpServletRequest httpServletRequest, HttpServletResponse response,ModelMap model){
		TeacherInfo teacherInfo = serarchManager.teacherInfoHandle(name);
		if(teacherInfo == null){
			return null;
		}
		model.addAttribute("teacherInfo",teacherInfo);
		return "showteacher";
	}
	@RequestMapping(value = "/modify/{name}")
	public String modify(@PathVariable("name") String name,HttpServletRequest httpServletRequest, HttpServletResponse response,ModelMap model){
		Teacher teacher = serarchManager.teacherHandle(name);
		if(teacher == null){
			return "exception";
		}
		model.addAttribute("teacher", teacher);
		return "modify";
	}

	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String update(@ModelAttribute("teacher")Teacher teacher,HttpServletRequest httpServletRequest,HttpServletResponse response,ModelMap model){
		System.out.println(teacher.getName() + teacher.getAge() + teacher.getSchool());
		teacherManager.updateTeacher(teacher);

		return "redirect:/hello?name="+teacher.getName();
	}

	@RequestMapping(value = "/download/{fileName}")
	public ResponseEntity<byte[]> download(@PathVariable("fileName")String fileName) throws IOException {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", "dict.txt");
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(new File("C:/Users/Sun/Documents/apache-tomcat-7.0.67-windows-x64/apache-tomcat-7.0.67/webapps/downloadtxt/"+fileName+".txt")),
				headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/jqgrid", method = RequestMethod.GET)
	public String jqgrid(HttpServletRequest httpServletRequest, HttpServletResponse response,ModelMap model) {
		return "wordlibrary/jqgrid";
	}
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String editadmin(HttpServletRequest httpServletRequest, HttpServletResponse response,ModelMap model) {
		return "wordlibrary/admin";
	}

	@RequestMapping(value = "/edit")
	public String laocEdit(Map map,@RequestParam(value = "wordsFileName",defaultValue="")String wordsFileName) {

		try {
			 map.put("WordsFile", wordFileBiz.findWordsFileByFileName(wordsFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "wordlibrary/edit";
	}

	/*@RequestMapping(value = "/update/{edit}",method = RequestMethod.POST)
	@ResponseBody
	public String insertWord(@PathVariable(value = "edit")String edit,WordsFile wordsFile){
		if("add".equals(edit)){
			wordFileBiz.addWordsFile(wordsFile);
		}
		return "success";
	}*/

	public String login(){
		return  null;
	}
	private String exception(String exceptionStr){
		return "exception";
	}

	/**
	 * 登入
	 */
	@RequestMapping(value="/loginAction", method=RequestMethod.POST)
	public String loginAction(@RequestParam(value="adminName") String adminName,
									@RequestParam(value="passWord") String passWord,
									HttpSession session ,Map map){
		if(adminBiz.findAdminByAdminNameAndPassWord(adminName,passWord)){
			session.setAttribute("admin", adminName);
			return "/wordlibrary/jqgrid";
		}else {
			map.put("error","用户名或密码错误");
			return "/wordlibrary/login";
		}
	}

	@RequestMapping(value = "/admindateedit", method = RequestMethod.GET)
	public String adminEdit(Map map,@RequestParam(value = "adminName",defaultValue="")String adminName) {
		try {
			  map.put("Admin", adminBiz.findAllAdminByAdminName(adminName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "wordlibrary/adminedit";
	}
}