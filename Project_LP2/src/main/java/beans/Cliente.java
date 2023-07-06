package beans;

public class Cliente {
	private int idCliente;
	private String dniCliente;
	private String nomCliente;
	private String dirCliente;
	private String emailCliente;
	private String password;


	public Cliente() {
		
	}


	public Cliente(int idCliente, String dniCliente, String nomCliente, String dirCliente, String emailCliente,
			String password) {
		super();
		this.idCliente = idCliente;
		this.dniCliente = dniCliente;
		this.nomCliente = nomCliente;
		this.dirCliente = dirCliente;
		this.emailCliente = emailCliente;
		this.password = password;
	}
	


	public int getIdCliente() {
		return idCliente;
	}


	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}


	public String getDniCliente() {
		return dniCliente;
	}


	public void setDniCliente(String dniCliente) {
		this.dniCliente = dniCliente;
	}


	public String getNomCliente() {
		return nomCliente;
	}


	public void setNomCliente(String nomCliente) {
		this.nomCliente = nomCliente;
	}


	public String getDirCliente() {
		return dirCliente;
	}


	public void setDirCliente(String dirCliente) {
		this.dirCliente = dirCliente;
	}


	public String getEmailCliente() {
		return emailCliente;
	}


	public void setEmailCliente(String emailCliente) {
		this.emailCliente = emailCliente;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "Cliente [idCliente=" + idCliente + ", dniCliente=" + dniCliente + ", nomCliente=" + nomCliente
				+ ", dirCliente=" + dirCliente + ", emailCliente=" + emailCliente + ", password=" + password
				+ ", getDniCliente()=" + getDniCliente() + ", getNomCliente()=" + getNomCliente() + ", getDirCliente()="
				+ getDirCliente() + ", getEmailCliente()=" + getEmailCliente() + ", getPassword()=" + getPassword()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	

	
	
	
	
}
