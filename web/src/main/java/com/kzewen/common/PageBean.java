package com.kzewen.common;

import java.util.List;

public class PageBean<T> {
	//当前页面数currentPage
	private int currentPage;
	//总页面数totalPage
	private int totalPage;
	//每页的记录数pageSize
	private int pageSize;
	//总记录数totalSize
	private int totalSize;
	//存放当前页面的数据的集合
	private List<T> list;



	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
}
