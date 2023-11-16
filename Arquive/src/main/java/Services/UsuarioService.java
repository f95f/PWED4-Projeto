package Services;

import java.sql.ResultSet;
import java.sql.SQLException;

import classes.models.UserSession;
import classes.models.Usuario;

public class UsuarioService {

	private Usuario usuario = new Usuario();
	
	public UserSession login(String email, String senha) {
		
		String errorMessage = "";
		UserSession session = new UserSession();
		
		ResultSet rs = usuario.buscarPor("email", email);
		
		try {
			
			rs.next();

			String userAccessStatus = rs.getString("acesso");
			String userPassword = rs.getString("senha");
			
			if(!(userPassword.equals(senha))) {
				errorMessage = "401 Usuário ou senha incorretos.";
			}
			else if(userAccessStatus.equals("inativo")) {
				errorMessage = "401 Acesso não autorizado.";
			}
			else {
				
				session.setIdUsuario(rs.getInt("id"));
				session.setIdNivelUsuario(rs.getString("nivel"));
				session.setNome(rs.getString("nome"));
				session.setStatus("200 ok");
				session.setPodeEntrar(true);
				return session;
			}			
		
		} catch (SQLException e) {
			errorMessage = "404 Usuário não encontrado.";
		}
		
		session.setIdNivelUsuario(null);
		session.setIdUsuario(0);
		session.setNome(null);
		session.setStatus(errorMessage);
		session.setPodeEntrar(false);
		
		return session;
	}
	public Usuario buscar(int id) {

		ResultSet rs = usuario.buscarPorId(id);
		Usuario usuarioEncontrado;
		
		try {
			usuarioEncontrado = new Usuario(
				rs.getInt("id"),
				rs.getString("email"),
				rs.getString("senha"),
				rs.getString("nivel"),
				rs.getString("nome"),
				rs.getString("telefone"),
				rs.getString("acesso")
			);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
				
		if(usuario.getAcesso().equals("Inativo")) { return null; }
		return usuario;
	}
	public Usuario buscarNovo(String email) {
		ResultSet rs = usuario.buscarPor("email", email);
		Usuario usuarioEncontrado;

		try {
			if(rs.next()) {
				System.out.println("\n\n > "+ rs.getString("email"));
				usuarioEncontrado = new Usuario(
					rs.getInt("id"),
					rs.getString("email"),
					rs.getString("senha"),
					rs.getString("nivel"),
					rs.getString("nome"),
					rs.getString("telefone"),
					rs.getString("acesso")
				);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
				
		return usuario;
	}
}
