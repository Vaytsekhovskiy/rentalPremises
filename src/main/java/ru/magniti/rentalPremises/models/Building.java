package ru.magniti.rentalPremises.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity // показывает, что класс является референсом к бд
@Table(name = "building") // задаём имя таблицы
@Data // геттеры, сеттеры, equals, hashCode, canEqual, toString
@AllArgsConstructor
@NoArgsConstructor
public class Building {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "location")
    private String location;
    // street..
    @Column(name = "price")
    private int price;
    @Column(name = "owner")
    private String owner;
    @Column(name = "description", columnDefinition = "text")
    private String description;
}
