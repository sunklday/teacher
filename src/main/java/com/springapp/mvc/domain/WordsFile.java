package com.springapp.mvc.domain;

/**
 * Created by Sun on 2016/5/5.
 */
public class WordsFile {
    private int id;
    private String wordsFileName;
    private String filePath;
    private String introduce;

    public String getIntroduce() {

        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWordsFileName() {
        return wordsFileName;
    }

    public void setWordsFileName(String wordsFileName) {
        this.wordsFileName = wordsFileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
