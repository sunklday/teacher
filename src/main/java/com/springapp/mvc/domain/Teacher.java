package com.springapp.mvc.domain;

/**
 * Created by admin on 2016/1/15.
 */
public class Teacher {
   /* CommonAnnotationBeanPostProcessor发现注解的名字*/

    private String name;
    private String age;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
}
