package beans;
import java.util.List;

public class Compra {
    private int IdCompra;
    private Cliente cliente;
    private int IdPago;
    private String FechaVenta;
    private double MontoTotal;
    private String Estado;
    
    private List<Carrito>detallecompras;
	public Compra() {
		
	}
	public Compra(Cliente cliente, int idPago, String fechaVenta, double montoTotal, String estado,
			List<Carrito> detallecompras) {
		
	
		this.cliente = cliente;
		this.IdPago = idPago;
		this.FechaVenta = fechaVenta;
		this.MontoTotal = montoTotal;
		this.Estado = estado;
		this.detallecompras = detallecompras;
	}
	public int getIdCompra() {
		return IdCompra;
	}
	public void setIdCompra(int idCompra) {
		IdCompra = idCompra;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public int getIdPago() {
		return IdPago;
	}
	public void setIdPago(int idPago) {
		IdPago = idPago;
	}
	public String getFechaVenta() {
		return FechaVenta;
	}
	public void setFechaVenta(String fechaVenta) {
		FechaVenta = fechaVenta;
	}
	public double getMontoTotal() {
		return MontoTotal;
	}
	public void setMontoTotal(double montoTotal) {
		MontoTotal = montoTotal;
	}
	public String getEstado() {
		return Estado;
	}
	public void setEstado(String estado) {
		Estado = estado;
	}
	public List<Carrito> getDetallecompras() {
		return detallecompras;
	}
	public void setDetallecompras(List<Carrito> detallecompras) {
		this.detallecompras = detallecompras;
	}
	
	
	
	

	
    
}
