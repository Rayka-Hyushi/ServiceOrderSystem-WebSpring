//package org.example.sosweb.service;
//
//import org.example.sosweb.model.Cliente;
//import org.example.sosweb.model.OrdensServico;
//import org.example.sosweb.model.Servico;
//import org.example.sosweb.repository.OrdensServicoRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
//@Service
//public class MailService {
//
//    @Autowired
//    private OrdensServicoRepository ordensServicoRepository;
//
//    @Autowired
//    private EmailSender emailSender;
//
//    public int contaOrdens(int idcliente) {
//        return ordensServicoRepository.countByClienteId(idcliente);
//    }
//
//    public String montarMensagem(Cliente cliente, List<Servico> lista, OrdensServico oc, int totalOrdens) {
//        StringBuilder mailbuilder = new StringBuilder();
//
//        if (totalOrdens < 2 && oc.getStatus().equals("Pagamento Pendente")) {
//            mailbuilder.append(String.format("Olá, %s!👋\n", cliente.getNome()))
//                    .append("Seu primeiro serviço foi completado com sucesso!\n")
//                    .append("Detalhes:\n");
//        } else if (totalOrdens >= 2 && oc.getStatus().equals("Pagamento Pendente")) {
//            mailbuilder.append(String.format("Olá, %s!\n", cliente.getNome()))
//                    .append("Seu serviço foi completado com sucesso!\n")
//                    .append("Detalhes:\n");
//        } else if (oc.getStatus().contains("Finalizado") && totalOrdens < 2) {
//            mailbuilder.append(String.format("Olá, %s!\n", cliente.getNome()))
//                    .append("Confirmamos o pagamento da sua primeira ordem!\n");
//        } else if (oc.getStatus().contains("Finalizado")) {
//            mailbuilder.append(String.format("Olá, %s!\n", cliente.getNome()))
//                    .append("Confirmamos o pagamento da sua ordem!\n");
//        } else {
//            return null;
//        }
//
//        int i = 1;
//        for (Servico s : lista) {
//            mailbuilder.append(String.format("%d - %s: R$ %.2f\n", i++, s.getNome(), s.getValor()));
//        }
//        mailbuilder.append(String.format("Desconto: R$ %.2f\n", oc.getDesconto()))
//                .append(String.format("Extras: R$ %.2f\n", oc.getExtras()))
//                .append(String.format("Total: R$ %.2f\n", oc.getTotal()))
//                .append("\nAgradecemos pela preferência!");
//
//        return mailbuilder.toString();
//    }
//
//    public int enviarEmail(Cliente cliente, OrdensServico oc, List<Servico> lista) {
//        int totalOrdens = contaOrdens(cliente.getIdcliente());
//        String mensagem = montarMensagem(cliente, lista, oc, totalOrdens);
//
//        if (mensagem == null) {
//            return 500;
//        }
//
//        String assunto = oc.getStatus().equals("Pagamento Pendente") ? "Serviço Finalizado!" : "Obrigado Pela Preferência!";
//        return emailSender.sendEmail(cliente.getEmail(), assunto, mensagem);
//    }
//}