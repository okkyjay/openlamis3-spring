/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fhi360.lamis.controller.model;

import lombok.Data;

/**
 *
 * @author User10
 */
@Data
public class BiometricResult {
    private Long patientId;
    private Long facilityId;
    private String name;
    private String address;
    private String phone;
    private String gender;
    private String message;
    private Boolean inFacility = true;
}
