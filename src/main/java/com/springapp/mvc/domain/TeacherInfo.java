package com.springapp.mvc.domain;

/**
 * Created by admin on 2016/1/25.
 */
public class TeacherInfo {
    private String name;
    private String classid;
    private String subject;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
