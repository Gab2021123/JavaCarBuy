package interfaces;

import beans.Compra;

public interface CompraDAO {
	public int GenerarCompra(Compra compra);
	public String Estado(Compra compra);
}
