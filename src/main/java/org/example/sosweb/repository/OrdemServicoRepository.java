package org.example.sosweb.repository;

import org.example.sosweb.model.OrdemServico;
import org.example.sosweb.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrdemServicoRepository extends JpaRepository<OrdemServico, Integer> {
    List<OrdemServico> findByUsuarioId(int idusuario);
    
    Optional<Object> findByOsidAndUsuario(int osid, Usuario usuario);
}
