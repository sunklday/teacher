package com.springapp.mvc.action;

import com.springapp.mvc.biz.AdminBiz;
import com.springapp.mvc.domain.Admin;
import com.springapp.mvc.domain.WordsFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PipedReader;
import java.util.Map;

/**
 * Created by Sun on 2016/5/6.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminAction {
    @Autowired
    private AdminBiz adminBiz;


    @RequestMapping(value = "/add/{edit}",method = RequestMethod.POST)
    @ResponseBody
    public String insertAdmin(@PathVariable("edit")String edit ,Admin admin){

        if("add".equals(edit)){

            adminBiz.addAdmin(admin);
        }
        return "success";
    }
}
