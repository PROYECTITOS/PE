package com.libreria.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TB_DETALLECARRITO")
@IdClass(ShopCarDetailID.class)
public class ShopCarDetail {

	@Id
	@ManyToOne
	@JoinColumn(name = "cod_car")
	private ShopCar car;
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	@Column(name = "num_det")
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "cod_lib")
	private Book book;
	
	@Column(name = "cant_det")
	private int cantidad;
	
	public ShopCarDetail(){}

	public ShopCarDetail(ShopCar car, Book book, int cantidad) {
		super();
		this.car = car;
		this.book = book;
		this.cantidad = cantidad;
	}

	public ShopCar getCar() {
		return car;
	}

	public void setCar(ShopCar car) {
		this.car = car;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
}
