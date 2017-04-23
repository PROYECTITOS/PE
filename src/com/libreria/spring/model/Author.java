package com.libreria.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TB_AUTOR")
public class Author {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_aut")
	private int id;

	@Column(name = "nom_aut")
	private String name;

	@Column(name = "apep_aut")
	private String f_last;

	@Column(name = "apem_aut")
	private String s_last;

	@Column(name = "cod_pais")
	private String country;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getF_last() {
		return f_last;
	}

	public void setF_last(String f_last) {
		this.f_last = f_last;
	}

	public String getS_last() {
		return s_last;
	}

	public void setS_last(String s_last) {
		this.s_last = s_last;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

}
