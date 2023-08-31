package com.thincrs.open311.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "service")
@Getter @Setter
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer service_id;
    private String name;
    private String description;
    private String type;
    private String keywords;
    private String group;
}
