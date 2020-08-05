package com.xiaoshu.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

public class Express implements Serializable {
    @Id
    private Integer eid;

    private String ename;

    private String esex;

    private String ehobby;

    private String photo;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date edate;

    private Integer cid;
    
    
    @Transient
    private String cname;
    @Transient
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date start;
    @Transient
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date end;
    
    

    public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

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
     * @return eid
     */
    public Integer getEid() {
        return eid;
    }

    /**
     * @param eid
     */
    public void setEid(Integer eid) {
        this.eid = eid;
    }

    /**
     * @return ename
     */
    public String getEname() {
        return ename;
    }

    /**
     * @param ename
     */
    public void setEname(String ename) {
        this.ename = ename == null ? null : ename.trim();
    }

    /**
     * @return esex
     */
    public String getEsex() {
        return esex;
    }

    /**
     * @param esex
     */
    public void setEsex(String esex) {
        this.esex = esex == null ? null : esex.trim();
    }

    /**
     * @return ehobby
     */
    public String getEhobby() {
        return ehobby;
    }

    /**
     * @param ehobby
     */
    public void setEhobby(String ehobby) {
        this.ehobby = ehobby == null ? null : ehobby.trim();
    }

    /**
     * @return photo
     */
    public String getPhoto() {
        return photo;
    }

    /**
     * @param photo
     */
    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
    }

    /**
     * @return edate
     */
    public Date getEdate() {
        return edate;
    }

    /**
     * @param edate
     */
    public void setEdate(Date edate) {
        this.edate = edate;
    }

    /**
     * @return cid
     */
    public Integer getCid() {
        return cid;
    }

    /**
     * @param cid
     */
    public void setCid(Integer cid) {
        this.cid = cid;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", eid=").append(eid);
        sb.append(", ename=").append(ename);
        sb.append(", esex=").append(esex);
        sb.append(", ehobby=").append(ehobby);
        sb.append(", photo=").append(photo);
        sb.append(", edate=").append(edate);
        sb.append(", cid=").append(cid);
        sb.append("]");
        return sb.toString();
    }
}