package com.springapp.mvc.biz;

import com.springapp.mvc.domain.Teacher;
import com.springapp.mvc.persistence.TeacherMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by admin on 2016/1/25.
 */
@Controller
public class TeacherManager {
    @Autowired
    private TeacherMapper teacherMapper;

    public void updateTeacher(Teacher teacher){
    teacherMapper.updateTeacher(teacher);
    }
}
