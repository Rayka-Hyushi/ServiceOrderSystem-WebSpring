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
                               @RequestParam(value = "idcliente", required = false) Integer idcliente,
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
                Optional<Cliente> buscaCliente = clienteService.findById(idcliente, usuario);
                Cliente cliente = null;
                if (buscaCliente.isPresent()) cliente = buscaCliente.get();
                model.addAttribute("cliente", cliente);
                model.addAttribute("servicos", servicos);
                model.addAttribute("ordemEdit", ordem.get());
                model.addAttribute("modo", "editar");

                // Adiciona os serviços relacionados à ordem (para exibir selecionados)
                model.addAttribute("servicosSelecionados", ordemServicoService.getServicosDaOrdem(ordem.get(), usuario));
            }
        } else if ("excluir".equals(action) && id != null) {
            ordemServicoService.delete(id, usuario); // Por enquanto, sem validação de serviços associados
        }

        model.addAttribute("ordens", ordemServicoService.read(usuario));
        return "ordens";
    }

    @PostMapping
    public String salvar(@RequestParam String modo,
                         @RequestParam Integer idcliente,
                         @RequestParam String descricao,
                         @RequestParam(value = "osid", required = false) Integer osid, // Mude 'id' para 'osid' para ser consistente com o input hidden
                         @RequestParam(value = "servicosIds", required = false) List<Integer> servicosIds, // Nova param para os IDs dos serviços
                         @RequestParam(value = "desconto", required = false, defaultValue = "0.00") BigDecimal desconto, // Capturar desconto
                         @RequestParam(value = "extras", required = false, defaultValue = "0.00") BigDecimal extras,     // Capturar extras
                         @RequestParam(value = "total", required = false, defaultValue = "0.00") BigDecimal total,       // Capturar total
                         @RequestParam(value = "status", required = false) String status, // Capturar status
                         HttpSession session) {
        if (session.getAttribute("usuario") == null) {
            return "redirect:/";
        }

        Usuario usuario = (Usuario) session.getAttribute("usuario");

        OrdemServico ordem = new OrdemServico();
        ordem.setDescricao(descricao);
        ordem.setUsuario(usuario);
        ordem.setDesconto(desconto);
        ordem.setExtras(extras);
        ordem.setTotal(total);
        ordem.setStatus(status != null ? status : "Pendente"); // Se status não vier, define como Pendente


        Optional<Cliente> cliente = clienteService.findById(idcliente, usuario);
        if (cliente.isPresent() && cliente.get().getUsuario().getId() == usuario.getId()) {
            ordem.setCliente(cliente.get());
        }

        if ("editar".equals(modo) && osid != null) {
            ordem.setOsid(osid); // Use osid
        }

        // Converta os servicosIds de volta para objetos Servico
        ArrayList<Servico> servicosParaSalvar = new ArrayList<>();
        if (servicosIds != null && !servicosIds.isEmpty()) {
            for (Integer servicoId : servicosIds) {
                servicoService.findById(servicoId, usuario).ifPresent(servicoParaSalvar -> {
                    // Verifique se o serviço pertence ao usuário logado, se necessário
                    if (servicoParaSalvar.getUsuario().getId() == usuario.getId()) {
                        servicosParaSalvar.add(servicoParaSalvar);
                    }
                });
            }
        }

        ordemServicoService.save(ordem, servicosParaSalvar); // salva OS e associa serviços
        return "redirect:/ordens";
    }
}