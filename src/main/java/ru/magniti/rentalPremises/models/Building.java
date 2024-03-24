package ru.magniti.rentalPremises.models;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data // геттеры, сеттеры, equals, hashCode, canEqual, toString
@AllArgsConstructor
public class Building {
    private Long id;
    private String name;
    private String location;
    private int price;
    private String owner;
    private String description;
}
