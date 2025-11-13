package com.example.uberentityservices.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Car extends BaseModel{

    @Column(nullable = false,unique = true)
    private String plateNumber;

    private String brand;

    private String model;

    @Enumerated(value= EnumType.STRING)
    private CarType cartype;

    @OneToOne
    private Driver driver;

    @ManyToOne
    private Color color;



}
