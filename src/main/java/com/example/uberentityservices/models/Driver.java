package com.example.uberentityservices.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import lombok.*;

import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor

@JsonIgnoreProperties({"hibernateLazyInitializer","handler","bookings"})//instead we have to use response Dtos>>>>
public class  Driver extends BaseModel{

    //DRIVER HAS MANY BOOKING 1:M

    private String name;

    @Column(nullable = false,unique = true)
    private String licencenumber;

    private String phoneNumber;

    private String aadharNumber;

    private String address;

    private String aadharCard;

    @OneToOne(mappedBy = "driver",cascade = CascadeType.ALL)//BIDIRECTIONAL ONE TO ONE MAPPING>>>>
    private Car car;//not understood this portions why to add in bothdriver and car>>>>

    @Enumerated(value=EnumType.STRING)
    private DriverApprovalStatus  driverApprovalStatus;

    @OneToOne //UNIDIRECTIONAL ONE TO ONE MAPPING>>>>>
    private ExactLocations  exactLocations;

    @OneToOne
    private ExactLocations home;

     private String activeCity;

     @DecimalMin(value="0.01",message = "Rating should be in between 0.0 and 5.0")
     @DecimalMax(value="5.0",message = "Rating should be in between 0.0 and 5.0")
     private double rating;


   private Boolean isAvailable;


    @OneToMany(mappedBy = "driver",fetch = FetchType.LAZY)
    private List<Bookings> bookings;

    @Override
    public String toString() {
        return "Driver{" +
                "name='" + name + '\'' +
                ", licencenumber='" + licencenumber + '\'' +
                ", bookings=" +
                '}';
    }
}
