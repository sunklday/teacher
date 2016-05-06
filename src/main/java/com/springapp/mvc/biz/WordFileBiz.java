package com.springapp.mvc.biz;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;


import com.springapp.base.Page;
import com.springapp.mvc.domain.WordsFile;
import com.springapp.mvc.persistence.WordsFileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.swing.plaf.basic.BasicScrollPaneUI;
import java.io.UnsupportedEncodingException;
import java.util.*;
/**
 * Created by Sun on 2016/5/5.
 */
@Component
public class WordFileBiz {

    @Autowired
    private WordsFileMapper wordsFileMapper;
    /**
     * 返回所有案例
     * @return
     */
    public Page findAllLaoCaCase(Integer page, Integer rows){

        List<WordsFile> list= wordsFileMapper.findAllWords(page * rows, rows);
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
        return   wordsFileMapper.findCount();
    }


   public void  addWordsFile(WordsFile wordsFile){
       if(wordsFile.getId()==0) {
           wordsFileMapper.addWordsFile(wordsFile);
       }
       else {
           wordsFileMapper.updateWordsFile(wordsFile);
       }

   }

    public WordsFile findWordsFileByFileName(String WordsFileName){
        return wordsFileMapper.findWordsFileByFileName(WordsFileName);
    }

    public void delectWordsFile(Integer id){
        wordsFileMapper.delectWordsFile(id);
    }
}
