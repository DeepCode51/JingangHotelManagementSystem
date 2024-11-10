package wyz.jingangHotel02.ssm.autoPo;

import java.util.List;

public class PageBean<T> {
	private int currPage;// 当前页数
	private int pageSize;// 每页条数
	private int totalCount;// 总记录数
	private int totalPage;// 总页数
	private List<T> list;// 查询的Goods集合

	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PageBean(int currPage, int pageSize, int totalCount, int totalPage,
			List<T> list) {
		super();
		this.currPage = currPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.list = list;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

}
