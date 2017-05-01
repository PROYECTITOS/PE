package com.libreria.spring.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "TB_CARRITO")
public class ShopCar {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_car")
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "id_usu")
	private User user;
	
	@Column(name = "fec_car")
	@Temporal(TemporalType.TIMESTAMP)
	private Date fecha;
	
	@Column(name = "est_car")
	private String estado;
	
	@OneToOne
	@JoinColumn(name = "cod_car")
	private Sale sale;
	
	@OneToMany
	private List<ShopCarDetail> shopCarDetails;

	public ShopCar(){}
	
	public ShopCar(User user, Date fecha, String estado) {
		super();
		this.user = user;
		this.fecha = fecha;
		this.estado = estado;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public List<ShopCarDetail> getShopCarDetails() {
		return shopCarDetails;
	}

	public void setShopCarDetails(List<ShopCarDetail> shopCarDetails) {
		this.shopCarDetails = shopCarDetails;
	}
	
	
}
