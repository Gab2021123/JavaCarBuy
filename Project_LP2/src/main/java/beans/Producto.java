package beans;



public class Producto {
		private int idProducto;
		private String nom;
		private String idcategoria;
		private String foto;
		private String descripcion;
		private double precio;
		private int stock;
		private String estado;
		public Producto() {
		
		}
		public Producto(int idProducto, String nom, String idcategoria, String foto, String descripcion, double precio,
				int stock, String estado) {
			super();
			this.idProducto = idProducto;
			this.nom = nom;
			this.idcategoria = idcategoria;
			this.foto = foto;
			this.descripcion = descripcion;
			this.precio = precio;
			this.stock = stock;
			this.estado = estado;
		}
		public int getIdProducto() {
			return idProducto;
		}
		public void setIdProducto(int idProducto) {
			this.idProducto = idProducto;
		}
		public String getNom() {
			return nom;
		}
		public void setNom(String nom) {
			this.nom = nom;
		}
		public String getIdcategoria() {
			return idcategoria;
		}
		public void setIdcategoria(String idcategoria) {
			this.idcategoria = idcategoria;
		}
		public String getFoto() {
			return foto;
		}
		public void setFoto(String foto) {
			this.foto = foto;
		}
		public String getDescripcion() {
			return descripcion;
		}
		public void setDescripcion(String descripcion) {
			this.descripcion = descripcion;
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
		public String getEstado() {
			return estado;
		}
		public void setEstado(String estado) {
			this.estado = estado;
		}
		

		
	
}
