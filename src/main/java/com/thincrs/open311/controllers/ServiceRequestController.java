package com.thincrs.open311.controllers;

import com.thincrs.open311.dao.ServiceRequestDAO;
import com.thincrs.open311.models.ServiceRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ServiceRequestController {

    @Autowired
    private ServiceRequestDAO serviceRequestDAO;

    @PostMapping(value = "api/v1/service_requests")
    public void insertServiceRequest(@RequestBody ServiceRequest servicerequest)
    {
        serviceRequestDAO.insertServiceRequest(servicerequest);
    }

    @GetMapping(value = "api/v1/service_requests")
    public List<ServiceRequest> getServiceRequest()
    {
        return serviceRequestDAO.getServiceRequest();
    }

    @GetMapping(value = "api/v1/service_requests/{service_id}")
    public ServiceRequest getServiceRequest(@PathVariable Integer service_request_id)
    {
        ServiceRequest servicerequest = new ServiceRequest();
        return servicerequest;
    }

    @PutMapping(value = "account13")
    public ServiceRequest updateService(@PathVariable Integer service_request_id)
    {
        ServiceRequest servicerequest = new ServiceRequest();
        servicerequest.setDescription("Servicio de recolección de Basura");
        return servicerequest;
    }

    @DeleteMapping(value = "api/v1/service_requests/{service_request_id}")
    public void deleteServiceRequest(@PathVariable Integer service_request_id)
    {
        serviceRequestDAO.delete(service_request_id);
    }

    @RequestMapping(value = "account38")
    public ServiceRequest searchService(@PathVariable Integer service_id)
    {
        ServiceRequest servicerequest = new ServiceRequest();
        servicerequest.setDescription("Servicio de recolección de Basura");
        return servicerequest;
    }
}
