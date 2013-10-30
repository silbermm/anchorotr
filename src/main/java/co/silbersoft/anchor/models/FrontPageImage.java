package co.silbersoft.anchor.models;

public class FrontPageImage {
	
	public FrontPageImage(String url, String className) {
		this.className = className;
		this.url = url;
		this.order =1;
	}
	
	public FrontPageImage(String url, String className, int order) {
		this.className = className;
		this.url=url;
		this.order=order;
	}

	
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getOrder() {
		return this.order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	
	private String className;
	private String url;
	private int order;
}
