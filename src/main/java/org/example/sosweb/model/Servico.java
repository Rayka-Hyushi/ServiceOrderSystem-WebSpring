package org.example.sosweb.model;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "servico")
public class Servico {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idservico;

    @Column(length = 100, nullable = false)
    private String nome;

    @Column(length = 500, nullable = false)
    private String descricao;

    @Column(precision = 10, scale = 2, nullable = false)
    private BigDecimal valor;

    @ManyToOne
    @JoinColumn(name = "idusuario", nullable = false)
    private Usuario usuario;

    public int getIdservico() {
        return idservico;
    }

    public void setIdservico(int idservico) {
        this.idservico = idservico;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public String toString() {
        return this.nome;
    }
}
