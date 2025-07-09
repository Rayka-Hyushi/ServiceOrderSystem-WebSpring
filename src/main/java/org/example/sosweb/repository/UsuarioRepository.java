package org.example.sosweb.repository;

import org.example.sosweb.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {
    // Método para login (busca por email e senha)
    Usuario findByEmailAndSenha(String email, String senha);

    @Query("select foto from Usuario where id = :id")
    byte[] findFotoById(@Param("id") Integer id);
    
    Usuario findByEmail(String email);
}
