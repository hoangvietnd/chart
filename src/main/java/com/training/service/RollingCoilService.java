package com.training.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.training.dao.RollingCoilRepository;
import com.training.entity.RollingCoil;
import com.training.util.RecordNotFoundException;

@Service
public class RollingCoilService {

	@Autowired
    RollingCoilRepository repository;

	public List<RollingCoil> getAllRollingCoils() {
        return repository.findAll();
    }

	public RollingCoil getRollingCoilById(Long id) throws RecordNotFoundException {
        return repository.findById(id).orElseThrow(() -> new RecordNotFoundException("No rolling coil record exist for given id"));
    }

	public RollingCoil createOrUpdateRollingCoil(RollingCoil entity) {
        return repository.findById(entity.getId())
                .map(rollingCoil -> {
                    rollingCoil.setCoilNo(entity.getCoilNo());
                    rollingCoil.setCoilName(entity.getCoilName());
                    return repository.save(rollingCoil);
                })
                .orElseGet(() -> repository.save(entity));
    }

	public void deleteRollingCoilById(Long id) throws RecordNotFoundException {
        RollingCoil rollingCoil = getRollingCoilById(id);
        repository.delete(rollingCoil);
    }

}
