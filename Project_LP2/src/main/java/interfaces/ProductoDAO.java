package interfaces;

import java.util.List;

import beans.Producto;

public interface ProductoDAO {
	public Producto listarId(int id);
	public List<Producto> listarxcategoria(String id);
}
