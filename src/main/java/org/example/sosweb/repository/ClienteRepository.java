package org.example.sosweb.repository;

import org.example.sosweb.model.Cliente;
import org.example.sosweb.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Optional;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Integer> {
    Optional<Cliente> findByIdclienteAndUsuario(Integer idcliente, Usuario usuario);
    
    @Query("select c from Cliente c where c.usuario.id = :idusuario")
    ArrayList<Cliente> findAllByIdusuario(@Param("idusuario")Integer idusuario);
}