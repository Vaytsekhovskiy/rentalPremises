package ru.magniti.rentalPremises.models;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "logs")
@Data
public class Log {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "description", columnDefinition = "text")
    private String description;
    private LocalDateTime dateOfCreated;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    User user;
    @PrePersist // метод инициализации бина в спринге
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }
    public String getStringDate(){
        return dateOfCreated.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
    }
}
