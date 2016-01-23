package com.springapp.mvc.domain;

/**
 * Created by admin on 2016/1/15.
 */
public class Teacher {
   /* CommonAnnotationBeanPostProcessor发现注解的名字*/

    private String name;
    private Integer age;
    private String school;

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
