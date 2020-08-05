package com.xiaoshu.entity;

import java.io.Serializable;
import javax.persistence.*;

public class Company implements Serializable {
    @Id
    private Integer cid;

    private String cnmae;

    private static final long serialVersionUID = 1L;

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

    /**
     * @return cnmae
     */
    public String getCnmae() {
        return cnmae;
    }

    /**
     * @param cnmae
     */
    public void setCnmae(String cnmae) {
        this.cnmae = cnmae == null ? null : cnmae.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", cid=").append(cid);
        sb.append(", cnmae=").append(cnmae);
        sb.append("]");
        return sb.toString();
    }
}