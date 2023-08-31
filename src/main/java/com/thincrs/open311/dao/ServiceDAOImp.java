package com.thincrs.open311.dao;

import com.thincrs.open311.models.Service;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class ServiceDAOImp implements ServiceDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Service> getServices() {
        String query = "FROM Service";
        return entityManager.createQuery(query).getResultList();
    }

    @Override
    public void delete(Integer service_id) {
        Service service = entityManager.find(Service.class, service_id);
        entityManager.remove(service);
    }
}
