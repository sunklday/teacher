package com.springapp.mvc.biz;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.springapp.base.Page;
import com.springapp.mvc.domain.Admin;
import com.springapp.mvc.persistence.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Sun on 2016/5/6.
 */
@Component
public class AdminBiz {

    @Autowired
    private AdminMapper adminMapper;

    public boolean findAdminByAdminNameAndPassWord(String adminName,String passWord){

        if(adminMapper.findAdminByAdminAndPassWord(adminName, passWord)==null){
            return false;
        }
        return true;

    }
    public Page findAllAdmin(Integer page, Integer rows){

        List<Admin> list= adminMapper.findAllAdmin(page * rows, rows);
        Integer records = this.findRecords();
        Integer total = records%rows==0?records/rows:records/rows+1;
        List<JSONObject> jsonObjectList = new ArrayList();
        for (int i = 1;i<=list.size();i++){
            JSONObject newJson = new JSONObject();
            newJson = (JSONObject) JSON.toJSON(list.get(i - 1));
            newJson.put("id", i +rows*(page)+ "");
            jsonObjectList.add(newJson);
        }
        Page<JSONObject> page1=new Page(page+1,total,records,jsonObjectList);
        return page1;

    }

    public Integer findRecords(){
        return   adminMapper.findCount();
    }
    public Admin findAllAdminByAdminName(String WordsFileName){
        return adminMapper.findAllAdminByAdminName(WordsFileName);
    }

    public void  addAdmin(Admin admin){
        if(admin.getId()==0) {
            adminMapper.addAdmin(admin);
        }
        else {
            adminMapper.updateAdmin(admin);
        }
    }
}
