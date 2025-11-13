package com.example.uberentityservices.models;


import com.fasterxml.jackson.databind.ser.Serializers;
import jakarta.persistence.Entity;
import lombok.*;

import java.util.Random;

@Entity
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OTP extends BaseModel {

    private String code;
    private String sentToNumber;

    public static OTP OTPMAKER(String phoneNumber) {

        Random random = new Random();

        Integer code=random.nextInt(9000)+1000;

        return OTP.builder().code(code.toString()).sentToNumber(phoneNumber).build();
    }
}
