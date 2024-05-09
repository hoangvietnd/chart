package com.rajeshkawali.service;

import com.rajeshkawali.dao.EmployeeDoa;
import com.rajeshkawali.dao.RollingCoilDoa;
import com.rajeshkawali.entity.Employee;
import com.rajeshkawali.entity.RollingCoil;
import com.rajeshkawali.util.RecordNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class RollingCoilService {

	@Autowired
	RollingCoilDoa repository;

	public List<RollingCoil> getAllRollingCoils() {
		List<RollingCoil> rollingCoilList = repository.findAll();

		if (!rollingCoilList.isEmpty()) {
			return rollingCoilList;
		} else {
			return new ArrayList<RollingCoil>();
		}
	}

	public RollingCoil getRollingCoilById(Long id) throws RecordNotFoundException {
		Optional<RollingCoil> rollingCoil = repository.findById(id);

		if (rollingCoil.isPresent()) {
			return rollingCoil.get();
		} else {
			throw new RecordNotFoundException("No rolling coil record exist for given id");
		}
	}

	public RollingCoil createOrUpdateRollingCoil(RollingCoil entity) throws RecordNotFoundException {
		Optional<RollingCoil> rollingCoil = repository.findById(entity.getId());

		if (rollingCoil.isPresent()) {
			RollingCoil newEntity = rollingCoil.get();
			newEntity.setCoilNo(entity.getCoilNo());
			newEntity.setCoilName(entity.getCoilName());

			newEntity = repository.save(newEntity);

			return newEntity;
		} else {
			entity = repository.save(entity);
			return entity;
		}
	}

	public void deleteRollingCoilById(Long id) throws RecordNotFoundException {
		Optional<RollingCoil> rollingCoil = repository.findById(id);

		if (rollingCoil.isPresent()) {
			repository.deleteById(id);
		} else {
			throw new RecordNotFoundException("No rolling coil record exist for given id");
		}
	}

}
