package com.libreria.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "TB_LIBRO")
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_lib")
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "cod_aut")
	private Author author;
	
	@ManyToOne
	@JoinColumn(name = "cod_edi")
	private Editorial editorial;
	
	@ManyToOne
	@JoinColumn(name = "cod_gen")
	private Category category;
	
	@ManyToOne
	@JoinColumn(name = "cod_enc")
	private BookBinding bookBinding;
	
	@Column(name = "tit_lib",length = 500)
	private String titulo;
	
	@Column(name = "pais_lib",length = 50)
	private String pais;
	
	@Column(name = "fpub_lib")
	@Temporal(TemporalType.DATE)
	private Date fech_pub;
	
	@Column(name = "idi_lib",length = 20)
	private String idioma;
	
	@Column(name = "des_lib",length = 1000)
	private String descripcion;
	
	@Column(name = "ISBN_lib",length = 30)
	private String ISBN;
	
	//no me acuerdo que era esto
	@Column(name = "pag_lib")
	private String paginacion;
	
	@Column(name = "pre_lib",precision = 8,scale = 2)
	private double precio;
	
	@Column(name = "stock_lib")
	private int stock;
	
	@Column(name = "vend_lib")
	private int vendidos;
	
	@Column(name = "ruta_lib")
	private String ruta;
	
	public Book(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public Editorial getEditorial() {
		return editorial;
	}

	public void setEditorial(Editorial editorial) {
		this.editorial = editorial;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public BookBinding getBookBinding() {
		return bookBinding;
	}

	public void setBookBinding(BookBinding bookBinding) {
		this.bookBinding = bookBinding;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public Date getFech_pub() {
		return fech_pub;
	}

	public void setFech_pub(Date fech_pub) {
		this.fech_pub = fech_pub;
	}

	public String getIdioma() {
		return idioma;
	}

	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getPaginacion() {
		return paginacion;
	}

	public void setPaginacion(String paginacion) {
		this.paginacion = paginacion;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getVendidos() {
		return vendidos;
	}

	public void setVendidos(int vendidos) {
		this.vendidos = vendidos;
	}

	public String getRuta() {
		return ruta;
	}

	public void setRuta(String ruta) {
		this.ruta = ruta;
	}
	
	
}
