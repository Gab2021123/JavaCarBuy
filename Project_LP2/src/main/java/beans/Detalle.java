package beans;

public class Detalle {
		private int IdDetalle;
		private int IdCompra;
	    private int IdProducto;
	    private int Cantidad;
	    private double PrecioUnidad;
		public Detalle() {
			
		}
		public Detalle(int idDetalle, int idCompra, int idProducto, int cantidad, double precioUnidad) {
			
			IdDetalle = idDetalle;
			IdCompra = idCompra;
			IdProducto = idProducto;
			Cantidad = cantidad;
			PrecioUnidad = precioUnidad;
		}
		public int getIdDetalle() {
			return IdDetalle;
		}
		public void setIdDetalle(int idDetalle) {
			IdDetalle = idDetalle;
		}
		public int getIdCompra() {
			return IdCompra;
		}
		public void setIdCompra(int idCompra) {
			IdCompra = idCompra;
		}
		public int getIdProducto() {
			return IdProducto;
		}
		public void setIdProducto(int idProducto) {
			IdProducto = idProducto;
		}
		public int getCantidad() {
			return Cantidad;
		}
		public void setCantidad(int cantidad) {
			Cantidad = cantidad;
		}
		public double getPrecioUnidad() {
			return PrecioUnidad;
		}
		public void setPrecioUnidad(double precioUnidad) {
			PrecioUnidad = precioUnidad;
		}
		
		
	 
}
