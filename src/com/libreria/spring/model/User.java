package com.libreria.spring.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TB_USUARIO")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_usu")
	private int id;//es varchar en la db
	
	@Column(name = "user_usu")
	private String userName;//no existe en la db
	
	@Column(name = "pwd_usu")
	private String password;
	
	@ManyToOne
	@JoinColumn(name = "cod_tusu")
	private UserType userType;
	
	@Column(name = "nom_usu")
	private String nombre;
	
	@Column(name = "apep_usu")
	private String apellidoPaterno;
	
	@Column(name = "apem_usu")
	private String apellidoMaterno;
	
	@Column(name = "mail_usu")
	private String email;
	
	@Column(name = "dni_usu")
	private String dni;
	
	@ManyToOne
	@JoinColumn(name = "cod_pre")
	private UserQuestion question;
	
	@Column(name = "res_usu")
	private String respuesta;
	
	@Column(name = "foto_usu")
	private String foto;
	
	@Column(name = "est_usu")
	private String estado;
	
	@Column(name = "pre_usu")
	private String preferencias;//debe normalizarse
	
	@OneToMany
	private List<ShopCar> shopCars;
	
	public User(){}

	public User(String userName, String password, UserType userType, String nombre, String apellidoPaterno,
			String apellidoMaterno, String email, String dni, UserQuestion question, String respuesta, String foto,
			String estado, String preferencias) {
		super();
		this.userName = userName;
		this.password = password;
		this.userType = userType;
		this.nombre = nombre;
		this.apellidoPaterno = apellidoPaterno;
		this.apellidoMaterno = apellidoMaterno;
		this.email = email;
		this.dni = dni;
		this.question = question;
		this.respuesta = respuesta;
		this.foto = foto;
		this.estado = estado;
		this.preferencias = preferencias;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserType getUserType() {
		return userType;
	}

	public void setUserType(UserType userType) {
		this.userType = userType;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidoPaterno() {
		return apellidoPaterno;
	}

	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}

	public String getApellidoMaterno() {
		return apellidoMaterno;
	}

	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public UserQuestion getQuestion() {
		return question;
	}

	public void setQuestion(UserQuestion question) {
		this.question = question;
	}

	public String getRespuesta() {
		return respuesta;
	}

	public void setRespuesta(String respuesta) {
		this.respuesta = respuesta;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getPreferencias() {
		return preferencias;
	}

	public void setPreferencias(String preferencias) {
		this.preferencias = preferencias;
	}

	public List<ShopCar> getShopCars() {
		return shopCars;
	}

	public void setShopCars(List<ShopCar> shopCars) {
		this.shopCars = shopCars;
	}
	
	
}
