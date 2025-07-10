package org.example.sosweb.service;

import org.example.sosweb.model.Cliente;
import org.example.sosweb.model.Usuario;
import org.example.sosweb.repository.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ClienteService {
    @Autowired
    private ClienteRepository clienteRepository;
    
    public ClienteService(ClienteRepository clienteRepository) {
        this.clienteRepository = clienteRepository;
    }

    public void save(Cliente cliente) {
        clienteRepository.save(cliente);
    }

    public List<Cliente> read(Integer idusuario) {
        return clienteRepository.findAllByIdusuario(idusuario);
    }

    public Optional<Cliente> findById(Integer id, Usuario usuario) {
        return clienteRepository.findByIdclienteAndUsuario(id, usuario);
    }

    public void delete(Integer id, Usuario usuario) {
        Optional<Cliente> cliente = clienteRepository.findByIdclienteAndUsuario(id, usuario);
        if (cliente.isPresent() && cliente.get().getUsuario().getId() == usuario.getId()) {
            clienteRepository.delete(cliente.get());
        }
    }
}
