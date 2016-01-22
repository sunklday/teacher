package com.springapp.mvc.biz;

import com.springapp.mvc.domain.Teacher;
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
    public TeacherMapper teacherMapper;

    public String teacherHandle(String name) {

        Teacher teacher=teacherMapper.getTeacher(name);

        if (teacher==null)
            return null;

        return teacher.getName();
    }
}
