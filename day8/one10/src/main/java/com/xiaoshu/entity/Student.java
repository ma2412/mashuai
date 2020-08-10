package com.xiaoshu.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

public class Student implements Serializable {
    @Id
    private Integer sid;

    private String sname;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date sdate;

    private String sage;

    private String ssex;

    private Integer tid;
    
    
    @Transient
    private String cname;
    
    
    public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private static final long serialVersionUID = 1L;

    /**
     * @return sid
     */
    public Integer getSid() {
        return sid;
    }

    /**
     * @param sid
     */
    public void setSid(Integer sid) {
        this.sid = sid;
    }

    /**
     * @return sname
     */
    public String getSname() {
        return sname;
    }

    /**
     * @param sname
     */
    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    /**
     * @return sdate
     */
    public Date getSdate() {
        return sdate;
    }

    /**
     * @param sdate
     */
    public void setSdate(Date sdate) {
        this.sdate = sdate;
    }

    /**
     * @return sage
     */
    public String getSage() {
        return sage;
    }

    /**
     * @param sage
     */
    public void setSage(String sage) {
        this.sage = sage == null ? null : sage.trim();
    }

    /**
     * @return ssex
     */
    public String getSsex() {
        return ssex;
    }

    /**
     * @param ssex
     */
    public void setSsex(String ssex) {
        this.ssex = ssex == null ? null : ssex.trim();
    }

    /**
     * @return tid
     */
    public Integer getTid() {
        return tid;
    }

    /**
     * @param tid
     */
    public void setTid(Integer tid) {
        this.tid = tid;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", sid=").append(sid);
        sb.append(", sname=").append(sname);
        sb.append(", sdate=").append(sdate);
        sb.append(", sage=").append(sage);
        sb.append(", ssex=").append(ssex);
        sb.append(", tid=").append(tid);
        sb.append("]");
        return sb.toString();
    }
}