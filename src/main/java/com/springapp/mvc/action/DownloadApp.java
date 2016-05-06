package com.springapp.mvc.action;

import com.alibaba.fastjson.JSONObject;
import com.springapp.base.Page;
import com.springapp.mvc.biz.AdminBiz;
import com.springapp.mvc.biz.WordFileBiz;
import com.springapp.mvc.domain.WordsFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by admin on 2016/5/3.
 */
@Controller
@RequestMapping(value = "/words")
public class DownloadApp  {
    @Autowired
    public WordFileBiz wordFileBiz;

    @Autowired
    public AdminBiz adminBiz;

    @RequestMapping(value = "read/{wordsSelect}")
    @ResponseBody
    public Page allCase(HttpServletRequest request,@RequestParam("page") Integer page,@RequestParam("rows") Integer rows,
                        @PathVariable("wordsSelect")String wordsSelect){
        page = page-1;
        String sortElement = request.getParameter("sidx");
        Integer sortMode = request.getParameter("sord").equals("asc")?1:0;
        if ("allcase".equals(wordsSelect)){

            return wordFileBiz.findAllLaoCaCase(page,rows);
        }
        return null;
    }


    @RequestMapping(value = "/admin/{wordsSelect}")
    @ResponseBody
    public Page allAdmin(HttpServletRequest request,@RequestParam("page") Integer page,@RequestParam("rows") Integer rows,
                        @PathVariable("wordsSelect")String wordsSelect){
        page = page-1;
        String sortElement = request.getParameter("sidx");
        Integer sortMode = request.getParameter("sord").equals("asc")?1:0;
        if ("allcase".equals(wordsSelect)){

            return adminBiz.findAllAdmin(page, rows);
        }
        return null;
    }

    @RequestMapping(value = "/update/{edit}",method = RequestMethod.POST)
    @ResponseBody
    public String updateWordFileAction(@PathVariable("edit")String edit,WordsFile wordsFile){

       if("add".equals(edit)){
           wordFileBiz.addWordsFile(wordsFile);
        }else if("dec".equals(edit)){
            wordFileBiz.delectWordsFile(wordsFile.getId());
        }
        return "success";
    }

    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public String springUpload(HttpServletRequest request) throws IllegalStateException, IOException
    {
        long  startTime=System.currentTimeMillis();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request))
        {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
            //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();

            while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                    String path="C:/Users/Sun/Documents/apache-tomcat-7.0.67-windows-x64/apache-tomcat-7.0.67/webapps/downloadtxt/"+file.getOriginalFilename();
                    //上传
                    file.transferTo(new File(path));
                }

            }

        }
        long  endTime=System.currentTimeMillis();
        System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return "success";
    }
}
