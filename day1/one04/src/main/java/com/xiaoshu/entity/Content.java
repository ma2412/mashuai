package com.xiaoshu.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

public class Content implements Serializable {
    @Id
    private Integer contentid;

    private Integer contentcategoryid;

    private String contenttitle;

    private String contenturl;

    private String picpath;

    private String price;

    private String status;
    
    

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createtime;
    
    @Transient
    private String cname;

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	private static final long serialVersionUID = 1L;

    /**
     * @return contentid
     */
    public Integer getContentid() {
        return contentid;
    }

    /**
     * @param contentid
     */
    public void setContentid(Integer contentid) {
        this.contentid = contentid;
    }

    /**
     * @return contentcategoryid
     */
    public Integer getContentcategoryid() {
        return contentcategoryid;
    }

    /**
     * @param contentcategoryid
     */
    public void setContentcategoryid(Integer contentcategoryid) {
        this.contentcategoryid = contentcategoryid;
    }

    /**
     * @return contenttitle
     */
    public String getContenttitle() {
        return contenttitle;
    }

    /**
     * @param contenttitle
     */
    public void setContenttitle(String contenttitle) {
        this.contenttitle = contenttitle == null ? null : contenttitle.trim();
    }

    /**
     * @return contenturl
     */
    public String getContenturl() {
        return contenturl;
    }

    /**
     * @param contenturl
     */
    public void setContenturl(String contenturl) {
        this.contenturl = contenturl == null ? null : contenturl.trim();
    }

    /**
     * @return picpath
     */
    public String getPicpath() {
        return picpath;
    }

    /**
     * @param picpath
     */
    public void setPicpath(String picpath) {
        this.picpath = picpath == null ? null : picpath.trim();
    }

    /**
     * @return price
     */
    public String getPrice() {
        return price;
    }

    /**
     * @param price
     */
    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    /**
     * @return status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    /**
     * @return createtime
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * @param createtime
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", contentid=").append(contentid);
        sb.append(", contentcategoryid=").append(contentcategoryid);
        sb.append(", contenttitle=").append(contenttitle);
        sb.append(", contenturl=").append(contenturl);
        sb.append(", picpath=").append(picpath);
        sb.append(", price=").append(price);
        sb.append(", status=").append(status);
        sb.append(", createtime=").append(createtime);
        sb.append("]");
        return sb.toString();
    }
}