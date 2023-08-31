package com.thincrs.open311.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "service_request")
@Getter @Setter
public class ServiceRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer service_request_id;
    private String address_string;
    private String email;
    private String first_name;
    private String last_name;
    private String phone;
    private String description;
    private String status;
}
