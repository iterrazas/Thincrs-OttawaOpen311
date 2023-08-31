package com.thincrs.open311.dao;

import com.thincrs.open311.models.ServiceRequest;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class ServiceRequestDAOImp implements ServiceRequestDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<ServiceRequest> getServiceRequest() {
        String query = "FROM ServiceRequest";
        return entityManager.createQuery(query).getResultList();
    }

    @Override
    public void delete(Integer service_request_id) {
        ServiceRequest servicerequest = entityManager.find(ServiceRequest.class, service_request_id);
        entityManager.remove(servicerequest);
    }

    @Override
    public void insertServiceRequest(ServiceRequest servicerequest) {
        entityManager.merge(servicerequest);
    }
}
