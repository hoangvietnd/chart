package com.training.dao;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.training.entity.RollingCoilData;

import java.util.List;

public interface RollingCoilDataRepository extends JpaRepository<RollingCoilData, Integer> {
    @Query(value = "SELECT rcd FROM RollingCoilData rcd LEFT JOIN FETCH rcd.rollingCoil rc WHERE rc.coilNo = :coilNo ORDER BY rcd.time")
    List<RollingCoilData> findByCoilNo(@Param("coilNo") String coilNo);

    @Query(value = "SELECT rcd FROM RollingCoilData rcd LEFT JOIN FETCH rcd.rollingCoil rc WHERE rc.coilNo = :coilNo ORDER BY rcd.time")
    List<RollingCoilData> findByCoilNoOnPage(@Param("coilNo") String coilNo, Pageable pageable);
}
