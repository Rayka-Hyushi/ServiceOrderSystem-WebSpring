package org.example.sosweb.controller;

import org.example.sosweb.model.Servico;
import org.example.sosweb.model.Usuario;
import org.example.sosweb.service.ServicoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/servicos")
public class ServicoController {
    @Autowired
    private ServicoService servicoService;

    @GetMapping
    public String listar(@RequestParam(value = "action", required = false) String action,
                         @RequestParam(value = "id", required = false) Integer id,
                         Model model,
                         HttpSession session) {

        if (session.getAttribute("usuario") == null) {
            return "redirect:/";
        }
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if ("novo".equals(action)) {
            model.addAttribute("modo", "novo");
        } else if ("editar".equals(action) && id != null) {
            Optional<Servico> servico = servicoService.findById(id, usuario);
            if (servico.isPresent()) {
                model.addAttribute("servico", servico.get());
                model.addAttribute("modo", "editar");
            }
        } else if ("excluir".equals(action) && id != null) {
            servicoService.delete(id, usuario);
        }

        List<Servico> servicos = servicoService.read(usuario.getId());
        model.addAttribute("servicos", servicos);

        return "servicos"; // Vai renderizar servicos.jsp
    }

    @PostMapping
    public String salvar(@RequestParam String modo,
                         @RequestParam String nome,
                         @RequestParam String descricao,
                         @RequestParam BigDecimal valor,
                         @RequestParam(value = "id", required = false) Integer id,
                         HttpSession session) {
        if (session.getAttribute("usuario") == null) {
            return "redirect:/";
        }
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        Servico servico = new Servico();
        servico.setNome(nome);
        servico.setDescricao(descricao);
        servico.setValor(valor);
        servico.setUsuario(usuario);

        if ("novo".equals(modo)) {
            servicoService.save(servico);
        } else if ("editar".equals(modo) && id != null) {
            servico.setIdservico(id);
            servicoService.save(servico);
        }

        return "redirect:/servicos";
    }
}