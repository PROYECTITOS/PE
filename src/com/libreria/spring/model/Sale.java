package com.libreria.spring.model;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "TB_VENTA")
public class Sale {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_car")
	private int id;
	
	@Column(name = "nom_vent")
	private String nombre;
	
	@Column(name = "dir_vent")
	private String direccion;
	
	@Column(name = "fec_vent")
	@Temporal(TemporalType.TIMESTAMP)
	private Date fecha;
	
	@Column(name = "monto_vent")
	private double monto;
	
	@ManyToOne
	@JoinColumn(name="cod_ttar")
	private CreditCardType creditCardType;
	
	//campo peligroso cuidado al usarlo
	@OneToOne
	@JoinColumn(name = "cod_car")
	private ShopCar shopCar;
	
	@Column(name = "num_tar")
	private int numeroTarjeta;
	
	@Column(name = "ccv_tar")
	private int ccv;
	
	@Column(name = "mexp_tar")
	private int mesExp;
	
	@Column(name = "yexp_tar")
	private int anioExp;
	
	public Sale(){}

	public Sale(String nombre, String direccion, Date fecha, double monto, CreditCardType creditCardType,
			int numeroTarjeta, int ccv, int mesExp, int anioExp) {
		super();
		this.nombre = nombre;
		this.direccion = direccion;
		this.fecha = fecha;
		this.monto = monto;
		this.creditCardType = creditCardType;
		this.numeroTarjeta = numeroTarjeta;
		this.ccv = ccv;
		this.mesExp = mesExp;
		this.anioExp = anioExp;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public double getMonto() {
		return monto;
	}

	public void setMonto(double monto) {
		this.monto = monto;
	}

	public CreditCardType getCreditCardType() {
		return creditCardType;
	}

	public void setCreditCardType(CreditCardType creditCardType) {
		this.creditCardType = creditCardType;
	}

	public ShopCar getShopCar() {
		return shopCar;
	}

	public void setShopCar(ShopCar shopCar) {
		this.shopCar = shopCar;
	}

	public int getNumeroTarjeta() {
		return numeroTarjeta;
	}

	public void setNumeroTarjeta(int numeroTarjeta) {
		this.numeroTarjeta = numeroTarjeta;
	}

	public int getCcv() {
		return ccv;
	}

	public void setCcv(int ccv) {
		this.ccv = ccv;
	}

	public int getMesExp() {
		return mesExp;
	}

	public void setMesExp(int mesExp) {
		this.mesExp = mesExp;
	}

	public int getAnioExp() {
		return anioExp;
	}

	public void setAnioExp(int anioExp) {
		this.anioExp = anioExp;
	}
	
	
	
}
