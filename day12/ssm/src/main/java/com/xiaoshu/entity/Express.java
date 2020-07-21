package com.xiaoshu.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "e_express")
public class Express implements Serializable {
    @Id
    private Integer kid;

    private String kname;

    private String area;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date kdate;

    
    private String price;

    private static final long serialVersionUID = 1L;

    /**
     * @return kid
     */
    public Integer getKid() {
        return kid;
    }

    /**
     * @param kid
     */
    public void setKid(Integer kid) {
        this.kid = kid;
    }

    /**
     * @return kname
     */
    public String getKname() {
        return kname;
    }

    /**
     * @param kname
     */
    public void setKname(String kname) {
        this.kname = kname == null ? null : kname.trim();
    }

    /**
     * @return area
     */
    public String getArea() {
        return area;
    }

    /**
     * @param area
     */
    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    /**
     * @return kdate
     */
    public Date getKdate() {
        return kdate;
    }

    /**
     * @param kdate
     */
    public void setKdate(Date kdate) {
        this.kdate = kdate;
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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", kid=").append(kid);
        sb.append(", kname=").append(kname);
        sb.append(", area=").append(area);
        sb.append(", kdate=").append(kdate);
        sb.append(", price=").append(price);
        sb.append("]");
        return sb.toString();
    }
}