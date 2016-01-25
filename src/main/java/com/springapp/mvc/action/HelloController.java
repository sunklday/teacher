package com.springapp.mvc.action;

import com.springapp.mvc.biz.SerarchManager;
import com.springapp.mvc.domain.Teacher;
import com.springapp.mvc.domain.TeacherInfo;
import com.springapp.mvc.persistence.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/")
public class HelloController {
	@Autowired
	public SerarchManager serarchManager;
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String printWelcome(HttpServletRequest httpServletRequest, HttpServletResponse response,ModelMap model) {

		return "index";
	}
	@RequestMapping(value = "/hello")
	public String printName(HttpServletRequest httpServletRequest, HttpServletResponse response,ModelMap model){
		String name =httpServletRequest.getParameter("name");

		Teacher teacher=serarchManager.teacherHandle(name);
		if (teacher==null)
			return exception("null");
		model.addAttribute("tercher", teacher);
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

	public String login(){
		return  null;
	}
	private String exception(String exceptionStr){
		return "exception";
	}
}