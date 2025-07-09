package org.example.sosweb.controller;

import jakarta.servlet.http.HttpSession;
import org.example.sosweb.model.Cliente;
import org.example.sosweb.model.OrdemServico;
import org.example.sosweb.model.Servico;
import org.example.sosweb.model.Usuario;
import org.example.sosweb.service.ClienteService;
import org.example.sosweb.service.OrdemServicoService;
import org.example.sosweb.service.ServicoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/ordens")
public class OrdemServicoController {
    @Autowired
    private OrdemServicoService ordemServicoService;

    @Autowired
    private ClienteService clienteService;
    @Autowired
    private ServicoService servicoService;

    @GetMapping
    public String listarOrdens(@RequestParam(value = "action", required = false) String action,
                               @RequestParam(value = "id", required = false) Integer id,
                               Model model,
                               HttpSession session) {
        if (session.getAttribute("usuario") == null) {
            return "redirect:/";
        }
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if ("novo".equals(action)) {
            model.addAttribute("modo", "novo");
            model.addAttribute("clientes", clienteService.read(usuario.getId()));
        } else if ("editar".equals(action) && id != null) {
            Optional<OrdemServico> ordem = ordemServicoService.findById(id);
            if (ordem.isPresent()) {
                ArrayList<Servico> servicos = (ArrayList<Servico>) servicoService.read(usuario.getId());
                model.addAttribute("servicos", servicos);
                model.addAttribute("ordemEdit", ordem.get());
                model.addAttribute("modo", "editar");

                // Adiciona os serviços relacionados à ordem (para exibir selecionados)
                model.addAttribute("servicosSelecionados", ordemServicoService.getServicosDaOrdem(ordem.get(), usuario));
            }
        } else if ("excluir".equals(action) && id != null) {
            ordemServicoService.delete(id); // Por enquanto, sem validação de serviços associados
        }

        model.addAttribute("ordens", ordemServicoService.read(usuario));
        model.addAttribute("servicos", ordemServicoService.read(usuario));
        return "ordens";
    }

    @PostMapping
    public String salvar(@RequestParam String modo,
                         @RequestParam Integer idcliente,
                         @RequestParam String descricao,
                         @RequestParam(value = "id", required = false) Integer id,
                         @RequestParam(value = "servicos", required = false) List<Servico> servicos,
                         HttpSession session) {
        if (session.getAttribute("usuario") == null) {
            return "redirect:/";
        }

        Usuario usuario = (Usuario) session.getAttribute("usuario");

        OrdemServico ordem = new OrdemServico();
        ordem.setDescricao(descricao);
        ordem.setTotal(BigDecimal.ZERO);
        ordem.setDesconto(BigDecimal.ZERO);
        ordem.setExtras(BigDecimal.ZERO);
        ordem.setStatus("Pendente");
        ordem.setUsuario(usuario);
        Optional<Cliente> cliente = clienteService.findById(idcliente, usuario);
        if (cliente.isPresent()) {
            ordem.setCliente(cliente.get());
        }

        if ("editar".equals(modo) && id != null) {
            ordem.setOsid(id);
        }

        ordemServicoService.save(ordem, servicos); // salva OS e associa serviços (ou não)
        return "redirect:/ordens";
    }
}