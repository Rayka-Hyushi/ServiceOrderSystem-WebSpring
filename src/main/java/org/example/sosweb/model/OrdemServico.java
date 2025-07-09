package org.example.sosweb.model;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "ordem_servico")
public class OrdemServico {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int osid;

    @ManyToOne
    @JoinColumn(name = "idcliente", nullable = false)
    private Cliente cliente;

    @Column(length = 400, nullable = false)
    private String descricao;

    @Column(precision = 10, scale = 2, nullable = false)
    private BigDecimal total;

    @Column(length = 20, nullable = false)
    private String status;

    @Column(precision = 10, scale = 2, nullable = false)
    private BigDecimal desconto;

    @Column(precision = 10, scale = 2, nullable = false)
    private BigDecimal extras;

    @ManyToOne
    @JoinColumn(name = "idusuario", nullable = false)
    private Usuario usuario;

    public int getOsid() {
        return osid;
    }

    public void setOsid(int osid) {
        this.osid = osid;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getDesconto() {
        return desconto;
    }

    public void setDesconto(BigDecimal desconto) {
        this.desconto = desconto;
    }

    public BigDecimal getExtras() {
        return extras;
    }

    public void setExtras(BigDecimal extras) {
        this.extras = extras;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
}
