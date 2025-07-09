package org.example.sosweb.service;

import org.example.sosweb.model.Usuario;
import org.example.sosweb.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {
    @Autowired
    private UsuarioRepository usuarioRepository;

    public Usuario login(String email, String senha) {
        return usuarioRepository.findByEmailAndSenha(email, senha);
    }

    public Usuario create(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    public Usuario update(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    public void delete(Usuario usuario) {
        usuarioRepository.delete(usuario);
    }

    public Usuario findByEmail(String email) {
        return usuarioRepository.findByEmail(email);
    }

    public byte[] foto(int id) {
        return usuarioRepository.findFotoById(id);
    }
}
