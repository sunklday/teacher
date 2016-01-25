package com.springapp.mvc.persistence;

import com.springapp.mvc.domain.TeacherInfo;

/**
 * Created by admin on 2016/1/25.
 */
public interface TeacherInfoMapper {
    TeacherInfo getTeacherInfo(String name);
}
