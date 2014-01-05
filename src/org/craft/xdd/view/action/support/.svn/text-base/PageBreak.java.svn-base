package org.craft.xdd.view.action.support;

import java.util.ArrayList;
import java.util.List;

/**
 * The helpler object for page break.
 * 
 * @author Frank Hu
 * @version 1.0, 2007/10/27
 */
public class PageBreak {

	/** Default page num */
	private int defaultPageNum = 24;

	/** Actual page num */
	private int pageNum;

	/** Each page item num */
	private int pageItemNum = 20;

	/** total item num */
	private long total;

	/** Current page index */
	private int currPage = 1;

	/** Pre page flag */
	private boolean prePageFlag;

	/** Pre page */
	private String prePage;

	/** Next page flag */
	private boolean nextPageFlag;

	/** Next page flag */
	private String nextPage;

	/** Base hyper link of each page index */
	private String baseLink;

	private List<HyperLink> pageList = new ArrayList<HyperLink>();

	public PageBreak() {
		super();
	}

	public PageBreak(int defaultPageListNum, int pageListNum, int pageItemNum,
			int wholeItemNum) {
		super();
		this.defaultPageNum = defaultPageListNum;
		this.pageNum = pageListNum;
		this.pageItemNum = pageItemNum;
		this.total = wholeItemNum;
	}

	private class HyperLink {

		private boolean linkFlag;

		private int idx;

		private String href;

		public HyperLink(int idx, String href, boolean linkFlag) {
			super();
			this.linkFlag = linkFlag;
			this.idx = idx;
			this.href = href;
		}

		public String getHref() {
			return href;
		}

		public void setHref(String href) {
			this.href = href;
		}

		public int getIdx() {
			return idx;
		}

		public void setIdx(int idx) {
			this.idx = idx;
		}

		public boolean getLinkFlag() {
			return linkFlag;
		}

		public void setLinkFlag(boolean linkFlag) {
			this.linkFlag = linkFlag;
		}

	}

	public int getDefaultPageNum() {
		return defaultPageNum;
	}

	public void setDefaultPageNum(int defaultPageListNum) {
		this.defaultPageNum = defaultPageListNum;
	}

	public int getPageItemNum() {
		return pageItemNum;
	}

	public void setPageItemNum(int pageItemNum) {
		this.pageItemNum = pageItemNum;
	}

	public long getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long wholeItemNum) {
		this.total = wholeItemNum;
		this.pageNum = (int) ((wholeItemNum % pageItemNum) == 0 ? (wholeItemNum / pageItemNum)
				: (wholeItemNum / pageItemNum + 1));
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public String getBaseLink() {
		return baseLink;
	}

	public void setBaseLink(String href) {
		this.baseLink = href;
	}

	public List<HyperLink> getPageList() {
		return pageList;
	}

	public void setPageList() {
		String href = null;
		if (pageNum <= defaultPageNum) {
			for (int i = 1; i <= pageNum; i++) {
				href = getBaseLink() + "&pageBreak.currPage=" + i;
				HyperLink hl = new HyperLink(i, href, true);
				if (i == currPage) {
					hl.setLinkFlag(false);
				}
				this.pageList.add(hl);
			}
		} else {
			nextPageFlag = true;
			nextPage = getBaseLink() + "&pageBreak.currPage="
					+ (defaultPageNum + 1);
			if (currPage > defaultPageNum) {
				int t = (currPage % defaultPageNum) == 0 ? defaultPageNum
						: (currPage % defaultPageNum);
				int s = currPage - t + 1;
				int e = (s + defaultPageNum) > pageNum ? pageNum
						: (s + defaultPageNum);
				for (int i = s; i <= e; i++) {
					href = getBaseLink() + "&pageBreak.currPage=" + i;
					HyperLink hl = new HyperLink(i, href, true);
					if (i == currPage) {
						hl.setLinkFlag(false);
					}
					this.pageList.add(hl);
				}
				prePageFlag = true;
				prePage = getBaseLink() + "&pageBreak.currPage=" + (s - 1);
				nextPage = getBaseLink() + "&pageBreak.currPage=" + e;
				if (currPage == pageNum) {
					nextPageFlag = false;
				}
			} else {
				for (int i = 1; i <= defaultPageNum; i++) {
					href = getBaseLink() + "&pageBreak.currPage=" + i;
					HyperLink hl = new HyperLink(i, href, true);
					if (i == currPage) {
						hl.setLinkFlag(false);
					}
					this.pageList.add(hl);
				}
			}
		}
	}

	public boolean getNextPageFlag() {
		return nextPageFlag;
	}

	public void setNextPageFlag(boolean nextPage) {
		this.nextPageFlag = nextPage;
	}

	public boolean getPrePageFlag() {
		return prePageFlag;
	}

	public void setPrePageFlag(boolean prePage) {
		this.prePageFlag = prePage;
	}

	public String getNextPage() {
		return nextPage;
	}

	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}

	public String getPrePage() {
		return prePage;
	}

	public void setPrePage(String prePage) {
		this.prePage = prePage;
	}

}
