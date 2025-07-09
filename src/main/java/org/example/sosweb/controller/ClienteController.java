package org.example.sosweb.controller;

import java.util.ArrayList;
import java.util.Optional;

import jakarta.servlet.http.HttpSession;
import org.example.sosweb.model.Cliente;
import org.example.sosweb.model.Usuario;
import org.example.sosweb.service.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/clientes")
public class ClienteController {
    @Autowired
    private ClienteService clienteService;

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
            Optional<Cliente> cliente = clienteService.findById(id, usuario);
            if (cliente.isPresent()) {
                model.addAttribute("cliente", cliente.get());
                model.addAttribute("modo", "editar");
            }
        } else if ("excluir".equals(action) && id != null) {
            clienteService.delete(id, usuario);
        }

        ArrayList<Cliente> clientes = clienteService.read(usuario.getId());
        model.addAttribute("clientes", clientes);
        return "clientes";
    }

    @PostMapping
    public String salvar(@RequestParam String modo,
                         @RequestParam String nome,
                         @RequestParam String telefone,
                         @RequestParam String email,
                         @RequestParam String endereco,
                         @RequestParam(value = "id", required = false) Integer id,
                         HttpSession session) {
        if (session.getAttribute("usuario") == null) {
            return "redirect:/";
        }
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        Cliente cliente = new Cliente();
        cliente.setNome(nome);
        cliente.setTelefone(telefone);
        cliente.setEmail(email);
        cliente.setEndereco(endereco);
        cliente.setUsuario(usuario);

        if ("novo".equals(modo)) {
            clienteService.save(cliente);
        } else if ("editar".equals(modo) && id != null) {
            cliente.setIdcliente(id);
            clienteService.save(cliente);
        }

        return "redirect:/clientes";
    }
}
