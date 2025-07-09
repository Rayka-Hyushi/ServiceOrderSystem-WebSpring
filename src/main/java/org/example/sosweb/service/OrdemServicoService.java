package org.example.sosweb.service;

import org.example.sosweb.model.*;
import org.example.sosweb.repository.ClienteRepository;
import org.example.sosweb.repository.OrdemServicoRepository;
import org.example.sosweb.repository.RelacaoOrdemServicoRepository;
import org.example.sosweb.repository.ServicoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class OrdemServicoService {
    @Autowired
    private OrdemServicoRepository ordemServicoRepository;

    @Autowired
    private RelacaoOrdemServicoRepository relacaoOrdemServicoRepository;

    @Autowired
    private ClienteRepository clienteRepository;

    @Autowired
    private ServicoRepository servicoRepository;

    public List<OrdemServico> read(Usuario usuario) {
        return ordemServicoRepository.findByUsuarioId(usuario.getId());
    }

    public Optional<OrdemServico> findById(int id) {
        return ordemServicoRepository.findById(id);
    }

    public void save(OrdemServico ordem, List<Servico> servicos) {
        // Salva a ordem
        ordemServicoRepository.save(ordem);

        // Remove relacionamentos antigos se existirem
        relacaoOrdemServicoRepository.deleteByOrdemServico(ordem);

        // Cria as novas relações
        if (servicos != null) {
            for (Servico s : servicos) {
                RelacaoOrdemServico rel = new RelacaoOrdemServico();
                rel.setOrdemServico(ordem);
                rel.setServico(s);
                relacaoOrdemServicoRepository.save(rel);
            }
        }
    }

    public List<Servico> getServicosDaOrdem(OrdemServico ordem, Usuario usuario) {
        List<RelacaoOrdemServico> relacoes = relacaoOrdemServicoRepository.findByOrdemServico(ordem);
        List<Servico> servicos = new ArrayList<>();
        for (RelacaoOrdemServico rel : relacoes) {
            if (rel.getServico().getUsuario().getId() == usuario.getId()) {
                servicos.add(rel.getServico());
            }
        }
        return servicos;
    }

    public void delete(Integer osid, Usuario usuario) {
        Optional<Object> ordem = ordemServicoRepository.findByOsidAndUsuario(osid, usuario);
        if (ordem.isPresent()) {
            ordemServicoRepository.delete(ordem);
        }
    }
}