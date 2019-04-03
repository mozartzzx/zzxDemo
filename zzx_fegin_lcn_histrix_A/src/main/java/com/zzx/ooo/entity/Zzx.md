package com.zzx.ooo.entity;

import javax.persistence.*;

@Table(name = "z_zx")
public class Zzx {
    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "C_NAME")
    private String cname;
    
    @Column(name="VERSION",updatable = false)
	private Integer version;
    
    public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	/**
     * @return ID
     */
    public String getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return C_NAME
     */
    public String getCname() {
        return cname;
    }

    /**
     * @param cname
     */
    public void setCname(String cname) {
        this.cname = cname;
    }
}