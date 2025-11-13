package com.example.uberentityservices.models;


import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NamedLocations extends BaseModel {

    @OneToOne
    private ExactLocations exactLocations;

    private String name;

    private String zipCode;

    private String city;

    private String country;

    private String state;
}
