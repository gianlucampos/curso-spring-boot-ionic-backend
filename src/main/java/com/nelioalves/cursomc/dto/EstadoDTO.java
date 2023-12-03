package com.nelioalves.cursomc.dto;

import com.nelioalves.cursomc.domain.Estado;
import com.nelioalves.cursomc.domain.Produto;
import java.io.Serial;
import java.io.Serializable;

public class EstadoDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;
    private String nome;

    public EstadoDTO() {
    }

    public EstadoDTO(Estado obj) {
        this.id = obj.getId();
        this.nome = obj.getNome();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
