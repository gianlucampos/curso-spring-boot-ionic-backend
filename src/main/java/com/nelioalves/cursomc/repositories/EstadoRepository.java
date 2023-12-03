package com.nelioalves.cursomc.repositories;

import com.nelioalves.cursomc.domain.Estado;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface EstadoRepository extends JpaRepository<Estado, Long> {

    @Transactional(readOnly = true)
    List<Estado> findAllByOrderByNome();

}
