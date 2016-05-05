package com.springapp.base;
import java.util.List;

/**
 * Description:
 * Author: wei
 * Date：2016/04/05
 */
public class Page<T> {
    //当前页
    private Integer page;
    //总页数
    private Integer total;
    //查询出的总记录数
    private Integer records;
    //数据存放
    private List<T> rows;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getRecords() {
        return records;
    }

    public void setRecords(Integer records) {
        this.records = records;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public Page(Integer page, Integer total, Integer records, List<T> rows) {
        this.page = page;
        this.total = total;
        this.records = records;
        this.rows = rows;
    }
}
