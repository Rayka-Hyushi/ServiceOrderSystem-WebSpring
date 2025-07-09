package org.example.sosweb.repository;

import org.example.sosweb.model.Cliente;
import org.example.sosweb.model.Servico;
import org.example.sosweb.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ServicoRepository extends JpaRepository<Servico, Integer> {
    Optional<Servico> findByIdservicoAndUsuario(Integer idservico, Usuario usuario);

    @Query("select s from Servico s where s.usuario.id = :idusuario")
    List<Servico> findAllByIdusuario(@Param("idusuario") Integer idusuario);
}
