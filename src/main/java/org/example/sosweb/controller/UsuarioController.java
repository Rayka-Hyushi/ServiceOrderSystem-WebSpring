package org.example.sosweb.controller;

import org.example.sosweb.model.Usuario;
import org.example.sosweb.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/cadastro")
    public String cadastrar() {
        return "cadastrar";
    }

    @PostMapping("/cadastrar")
    public String cadastrarUsuario(@RequestParam String username,
                                   @RequestParam String email,
                                   @RequestParam String password,
                                   RedirectAttributes redirectAttributes) {
        String senhaCriptografada = criptografar(password);

        Usuario novoUsuario = new Usuario();
        novoUsuario.setNome(username);
        novoUsuario.setEmail(email);
        novoUsuario.setSenha(senhaCriptografada);

        try {
            usuarioService.create(novoUsuario);
            redirectAttributes.addFlashAttribute("cadastro", true);
            return "redirect:/";
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            redirectAttributes.addFlashAttribute("cadastro", false);
            return "redirect:/usuario/cadastro";
        }
    }

    @PostMapping("/alterar")
    public String alterarUsuario(@RequestParam String username,
                                 @RequestParam String email,
                                 @RequestParam String password,
                                 @RequestParam("foto") MultipartFile foto,
                                 HttpSession session) throws IOException {
        if (session.getAttribute("usuario") == null) {
            return "redirect:/";
        }
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        usuario.setNome(username);
        usuario.setEmail(email);
        usuario.setSenha(criptografar(password));
        usuario.setFoto(foto.getBytes());

        usuarioService.update(usuario);

        return "redirect:/home";
    }

    private String criptografar(String texto) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashbytes = md.digest(texto.getBytes());

            StringBuilder sb = new StringBuilder();
            for (byte b : hashbytes) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Erro ao gerar hash", e);
        }
    }
}