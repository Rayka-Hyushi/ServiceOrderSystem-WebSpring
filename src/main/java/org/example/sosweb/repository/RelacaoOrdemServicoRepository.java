package org.example.sosweb.repository;

import org.example.sosweb.model.OrdemServico;
import org.example.sosweb.model.RelacaoOrdemServico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RelacaoOrdemServicoRepository extends JpaRepository<RelacaoOrdemServico, Integer> {
    List<RelacaoOrdemServico> findByOrdemServico(OrdemServico ordemServico);

    void deleteByOrdemServico(OrdemServico ordemServico);
}