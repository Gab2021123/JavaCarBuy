package beans;

public class Pago {
	private int idPag;
	private double montoPag;
	public Pago() {
	super();
	}
	public Pago(int idPag, double montoPag) {
		super();
		this.idPag = idPag;
		this.montoPag = montoPag;
	}
	public int getIdPag() {
		return idPag;
	}
	public void setIdPag(int idPag) {
		this.idPag = idPag;
	}
	public double getMontoPag() {
		return montoPag;
	}
	public void setMontoPag(double montoPag) {
		this.montoPag = montoPag;
	}
	
	
	
	
}
