package com.training.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.training.entity.RollingCoil;

@Repository
public interface RollingCoilDoa extends JpaRepository<RollingCoil, Long>{

	
}
