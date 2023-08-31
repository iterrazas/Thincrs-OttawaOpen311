package com.thincrs.open311.dao;

import com.thincrs.open311.models.Service;

import java.util.List;
public interface ServiceDAO {
    List<Service> getServices();

    void delete(Integer service_id);
}
