package interfaces;

import java.util.ArrayList;
import java.util.List;

public interface CRUD<T> {
	public List<T> listar();
	public T ver(int id);
	public int agregar(T t);
	public int  actulizar(T t);
	public int eliminar(int id);
}
