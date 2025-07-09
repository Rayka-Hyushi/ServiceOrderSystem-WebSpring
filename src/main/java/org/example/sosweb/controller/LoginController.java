package org.example.sosweb.controller;

import jakarta.servlet.http.HttpSession;
import org.example.sosweb.model.Usuario;
import org.example.sosweb.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        password = criptografar(password);

        Usuario usuario;
        try {
            usuario = loginService.login(email, password);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        if (usuario != null) {
            usuario.setSenha(null);
            session.setAttribute("usuario", usuario);
            return "redirect:/home";
        } else {
            redirectAttributes.addFlashAttribute("login", false);
            return "redirect:/";
        }
    }
    
    private String criptografar(String senha) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashbytes = md.digest(senha.getBytes());

            StringBuilder sb = new StringBuilder();
            for (byte b : hashbytes) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Erro ao gerar hash da senha", e);
        }
    }
}
