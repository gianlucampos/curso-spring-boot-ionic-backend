package com.nelioalves.cursomc.dto;

import com.nelioalves.cursomc.domain.Cidade;
import com.nelioalves.cursomc.domain.Estado;
import java.io.Serial;
import java.io.Serializable;

public class CidadeDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;
    private String nome;

    public CidadeDTO() {
    }

    public CidadeDTO(Cidade obj) {
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
