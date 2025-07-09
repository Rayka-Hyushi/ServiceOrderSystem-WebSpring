package org.example.sosweb.model;

import jakarta.persistence.*;

@Entity
@Table(name = "relacao_ordem_servico")
public class RelacaoOrdemServico {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rosid;

    @ManyToOne
    @JoinColumn(name = "osid")
    private OrdemServico ordemServico;

    @ManyToOne
    @JoinColumn(name = "idservico")
    private Servico servico;

    public int getRosid() {
        return rosid;
    }

    public void setRosid(int rosid) {
        this.rosid = rosid;
    }

    public OrdemServico getOrdemServico() {
        return ordemServico;
    }

    public void setOrdemServico(OrdemServico ordemServico) {
        this.ordemServico = ordemServico;
    }

    public Servico getServico() {
        return servico;
    }

    public void setServico(Servico servico) {
        this.servico = servico;
    }
}
