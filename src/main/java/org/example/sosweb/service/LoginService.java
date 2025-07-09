package org.example.sosweb.service;

import org.example.sosweb.model.Usuario;
import org.example.sosweb.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.NoSuchAlgorithmException;

@Service
public class LoginService {
    @Autowired
    private UsuarioRepository usuarioRepository;

    public Usuario login(String email, String password) throws NoSuchAlgorithmException {
        return usuarioRepository.findByEmailAndSenha(email, password);
    }
}
