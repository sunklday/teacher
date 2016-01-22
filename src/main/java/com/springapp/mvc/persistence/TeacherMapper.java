package com.springapp.mvc.persistence;

import com.springapp.mvc.domain.Teacher;
import org.apache.ibatis.annotations.Param;

/**
 * Created by admin on 2016/1/18.
 */
public interface TeacherMapper {
    Teacher getTeacher(String name);
}
