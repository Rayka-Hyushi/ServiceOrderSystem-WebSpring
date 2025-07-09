package org.example.sosweb.service;

import org.example.sosweb.model.Servico;
import org.example.sosweb.model.Usuario;
import org.example.sosweb.repository.ServicoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ServicoService {
    @Autowired
    private final ServicoRepository servicoRepository;
    
    public ServicoService(ServicoRepository repository) {
        this.servicoRepository = repository;
    }
    
    public void save(Servico servico) {
        servicoRepository.save(servico);
    }
    
    public List<Servico> read(Integer idusuario) {
        return servicoRepository.findAllByIdusuario(idusuario);
    }
    
    public Optional<Servico> findById(Integer id, Usuario usuario) {
        return servicoRepository.findByIdservicoAndUsuario(id, usuario);
    }
    
    public void delete(Integer id, Usuario usuario) {
        Optional<Servico> servico = servicoRepository.findByIdservicoAndUsuario(id, usuario);
        if (servico.isPresent() && servico.get().getUsuario().getId() == usuario.getId()) {
            servicoRepository.deleteById(id);
        }
    }
}