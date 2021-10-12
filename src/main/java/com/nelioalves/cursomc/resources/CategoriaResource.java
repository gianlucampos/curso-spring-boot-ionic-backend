package com.nelioalves.cursomc.resources;

import com.nelioalves.cursomc.domain.Categoria;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping(value = "/categorias")
public class CategoriaResource {

    @RequestMapping(method = RequestMethod.GET)
    public List<Categoria> listar() {
        Categoria cat1 = new Categoria(1L, "Informática");
        Categoria cat2 = new Categoria(2L, "Informática");
        return Arrays.asList(cat1, cat2);
    }

}
