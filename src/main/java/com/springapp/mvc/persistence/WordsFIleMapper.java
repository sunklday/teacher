package com.springapp.mvc.persistence;

import com.springapp.mvc.domain.WordsFile;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Sun on 2016/5/5.
 */
public interface WordsFileMapper {
    List<WordsFile> findAllWords(@Param("currentNum")int currentNum,@Param("rows")int rows);
    Integer findCount();
    void addWordsFile(WordsFile wordsFile);
}
