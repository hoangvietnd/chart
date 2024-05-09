package com.rajeshkawali.dao;

import com.rajeshkawali.entity.RollingCoil;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RollingCoilDoa extends JpaRepository<RollingCoil, Long>{

	
}
