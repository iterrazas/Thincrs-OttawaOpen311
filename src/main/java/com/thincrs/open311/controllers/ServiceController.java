package com.thincrs.open311.controllers;

import com.thincrs.open311.dao.ServiceDAO;
import com.thincrs.open311.models.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ServiceController {

    @Autowired
    private ServiceDAO serviceDAO;

    @PostMapping(value = "api/v1/services")
    public List<Service> createService()
    {
        return serviceDAO.getServices();
    }

    @GetMapping(value = "api/v1/services")
    public List<Service> getServices()
    {
        return serviceDAO.getServices();
    }

    @GetMapping(value = "api/v1/services/{service_id}")
    public Service getService(@PathVariable Integer service_id)
    {
        Service service = new Service();
        service.setService_id(service_id);
        service.setName("PASA");
        service.setDescription("Servicio de recolección de Basura");
        service.setType("Calle");
        service.setKeywords("pasa,basura,calle");
        service.setGroup("Basura");
        return service;
    }

    @PutMapping(value = "account1")
    public Service updateService(@PathVariable Integer service_id)
    {
        Service service = new Service();
        service.setService_id(service_id);
        service.setName("PASA");
        service.setDescription("Servicio de recolección de Basura");
        service.setType("Calle");
        service.setKeywords("pasa,basura,calle");
        service.setGroup("Basura");
        return service;
    }

    @DeleteMapping(value = "api/v1/services/{service_id}")
    public void deleteService(@PathVariable Integer service_id)
    {
        serviceDAO.delete(service_id);
    }

    @RequestMapping(value = "account3")
    public Service searchService(@PathVariable Integer service_id)
    {
        Service service = new Service();
        service.setService_id(service_id);
        service.setName("PASA");
        service.setDescription("Servicio de recolección de Basura");
        service.setType("Calle");
        service.setKeywords("pasa,basura,calle");
        service.setGroup("Basura");
        return service;
    }
}
