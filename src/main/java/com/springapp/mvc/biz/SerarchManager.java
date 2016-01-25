package com.springapp.mvc.biz;

import com.springapp.mvc.domain.Teacher;
import com.springapp.mvc.domain.TeacherInfo;
import com.springapp.mvc.persistence.TeacherInfoMapper;
import com.springapp.mvc.persistence.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

/**
 * Created by admin on 2016/1/15.
 */
@Controller
public class SerarchManager {
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private TeacherInfoMapper teacherInfoMapper;

    public Teacher teacherHandle(String name) {

        Teacher teacher=teacherMapper.getTeacher(name);

        if (teacher==null)
            return null;

        return teacher;
    }
    public TeacherInfo teacherInfoHandle(String name){
        TeacherInfo teacherInfo = teacherInfoMapper.getTeacherInfo(name);
        if(teacherInfo == null)
            return null;

        return teacherInfo;
    }
}
