//package org.example.sosweb.service;
//
//import org.example.sosweb.model.RelacaoOrdemServico;
//import org.example.sosweb.model.Servico;
//import org.example.sosweb.repository.RelacaoOrdemServicoRepository;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
//@Service
//public class RelacaoOrdemServicoService {
//
//    private final RelacaoOrdemServicoRepository repository;
//
//    public RelacaoOrdemServicoService(RelacaoOrdemServicoRepository repository) {
//        this.repository = repository;
//    }
//
//    public RelacaoOrdemServico create(int osid, Servico servico) {
//        RelacaoOrdemServico relacao = new RelacaoOrdemServico();
//        relacao.setRosid(osid);
//        relacao.setServico(servico);
//
//        return repository.save(relacao);  // Usando o save do Spring Data JPA
//    }
//
//    public List<Servico> findServicosByOsid(int osid) {
//        return repository.findServicosByOsid(osid);
//    }
//
//    public void delete(int osid, int idservico) {
//        repository.deleteByOsidAndIdservico(osid, idservico);
//    }
//}