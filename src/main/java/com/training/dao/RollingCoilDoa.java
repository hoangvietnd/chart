package com.training.dao;

import com.training.entity.RollingCoil;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RollingCoilDoa extends JpaRepository<RollingCoil, Long> {

}
