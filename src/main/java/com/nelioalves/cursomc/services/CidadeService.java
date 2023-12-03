package com.nelioalves.cursomc.services;

import com.nelioalves.cursomc.domain.Cidade;
import com.nelioalves.cursomc.repositories.CidadeRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CidadeService {

    @Autowired
    private CidadeRepository repo;

    public List<Cidade> findByEstado(Long estadoId) {
        return repo.findCidades(estadoId);
    }

}
