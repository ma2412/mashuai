package com.xiaoshu.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "express_person")
public class ExpressPerson implements Serializable {
    @Id
    private Integer id;

    @Column(name = "express_name")
    private String expressName;

    private String sex;

    @Column(name = "express_trait")
    private String expressTrait;

    @Column(name = "entry_time")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date entryTime;

    @Column(name = "create_time")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createTime;
    
    @Transient
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date start;
    
    @Transient
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date end;

    @Column(name = "express_type_id")
    private Integer expressTypeId;
    
    @Transient
    private String cname;
    
    

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
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return express_name
     */
    public String getExpressName() {
        return expressName;
    }

    /**
     * @param expressName
     */
    public void setExpressName(String expressName) {
        this.expressName = expressName == null ? null : expressName.trim();
    }

    /**
     * @return sex
     */
    public String getSex() {
        return sex;
    }

    /**
     * @param sex
     */
    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    /**
     * @return express_trait
     */
    public String getExpressTrait() {
        return expressTrait;
    }

    /**
     * @param expressTrait
     */
    public void setExpressTrait(String expressTrait) {
        this.expressTrait = expressTrait == null ? null : expressTrait.trim();
    }

    /**
     * @return entry_time
     */
    public Date getEntryTime() {
        return entryTime;
    }

    /**
     * @param entryTime
     */
    public void setEntryTime(Date entryTime) {
        this.entryTime = entryTime;
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return express_type_id
     */
    public Integer getExpressTypeId() {
        return expressTypeId;
    }

    /**
     * @param expressTypeId
     */
    public void setExpressTypeId(Integer expressTypeId) {
        this.expressTypeId = expressTypeId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", expressName=").append(expressName);
        sb.append(", sex=").append(sex);
        sb.append(", expressTrait=").append(expressTrait);
        sb.append(", entryTime=").append(entryTime);
        sb.append(", createTime=").append(createTime);
        sb.append(", expressTypeId=").append(expressTypeId);
        sb.append("]");
        return sb.toString();
    }
}