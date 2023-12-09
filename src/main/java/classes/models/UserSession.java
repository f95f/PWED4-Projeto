package classes.models;

public class UserSession {

		private int idUsuario;
		private String idNivelUsuario;
		private String nome;
		private String status;
		private boolean podeEntrar;
		
		public UserSession() {}

		public UserSession(int idUsuario, String idNivelUsuario, String nome, String status, boolean podeEntrar) {
			super();
			this.idUsuario = idUsuario;
			this.idNivelUsuario = idNivelUsuario;
			this.nome = nome;
			this.status = status;
			this.podeEntrar = podeEntrar;
		}


		public boolean isPodeEntrar() {
			return podeEntrar;
		}

		public void setPodeEntrar(boolean podeEntrar) {
			this.podeEntrar = podeEntrar;
		}

		public int getIdUsuario() {
			return idUsuario;
		}

		public void setIdUsuario(int idUsuario) {
			this.idUsuario = idUsuario;
		}

		public String getIdNivelUsuario() {
			return idNivelUsuario;
		}

		public void setIdNivelUsuario(String idNivelUsuario) {
			this.idNivelUsuario = idNivelUsuario;
		}

		public String getNome() {
			return nome;
		}

		public void setNome(String nome) {
			this.nome = nome;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

}
