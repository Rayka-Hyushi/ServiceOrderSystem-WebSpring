package org.example.sosweb.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.sosweb.model.Usuario;
import org.example.sosweb.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;

@Controller
public class HomeController {
    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
        if (session.getAttribute("usuario") == null) {
            return "redirect:/";
        } else {
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            Usuario atualizado = usuarioService.findByEmail(usuario.getEmail());
            atualizado.setSenha(null);
            model.addAttribute("usuario", atualizado);
            return "home";
        }
    }
}
