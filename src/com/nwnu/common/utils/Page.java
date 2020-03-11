package com.nwnu.common.utils;

import java.util.List;

public class Page<T> {
	private int total;  //��ҳ����
    private int page;   //��ǰ�ڼ�ҳ
    private int size;    //ÿҳ������
    private List<T> rows;   //��¼��
    public int getTotal() {
        return total;
    }
    public void setTotal(int total) {
        this.total = total;
    }
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public int getSize() {
        return size;
    }
    public void setSize(int size) {
        this.size = size;
    }
    public List<T> getRows() {
        return rows;
    }
    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
