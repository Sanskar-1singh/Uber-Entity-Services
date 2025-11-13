package com.example.uberentityservices.models;

import jakarta.persistence.Entity;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExactLocations extends BaseModel{

    private Double latitude;
    private Double longitude;


}
