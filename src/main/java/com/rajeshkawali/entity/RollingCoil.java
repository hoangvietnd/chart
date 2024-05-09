package com.rajeshkawali.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "rolling_coil")
public class RollingCoil {

	@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(name = "coil_no")
	private String coilNo;

	@Column(name = "coil_name")
	private String coilName;

	public RollingCoil() {

	}
	public RollingCoil(Long id, String coilNo, String coilName) {
		super();
		this.id = id;
		this.coilNo = coilNo;
		this.coilName = coilName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCoilNo() {
		return coilNo;
	}

	public void setCoilNo(String coilNo) {
		this.coilNo = coilNo;
	}

	public String getCoilName() {
		return coilName;
	}

	public void setCoilName(String coilNo) {
		this.coilName = coilName;
	}
}