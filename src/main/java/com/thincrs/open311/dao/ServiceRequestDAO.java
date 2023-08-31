package com.thincrs.open311.dao;

import com.thincrs.open311.models.ServiceRequest;

import java.util.List;

public interface ServiceRequestDAO {
    List<ServiceRequest> getServiceRequest();

    void delete(Integer service_request_id);

    void insertServiceRequest(ServiceRequest servicerequest);
}
