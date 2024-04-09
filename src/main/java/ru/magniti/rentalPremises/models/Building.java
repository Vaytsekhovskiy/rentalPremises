package ru.magniti.rentalPremises.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity // показывает, что класс является референсом к бд
@Table(name = "buildings") // задаём имя таблицы
@Data // геттеры, сеттеры, equals, hashCode, canEqual, toString
@AllArgsConstructor
@NoArgsConstructor
public class Building {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "location")
    private String location;
    // street..
    @Column(name = "price")
    private int price;
    @Column(name = "description", columnDefinition = "text")
    private String description;
    // создаём отношение один ко многим (Building тоже должен знать про это отношение)
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "building")
    // т.к. фотографий много, всё загружать не надо
    private List<Image> images = new ArrayList<>();
    private Long previewImageId;
    private LocalDateTime dateOfCreated;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinColumn
    User user;

    @PrePersist // метод инициализации бина в спринге
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }
    public void addImageToProduct(Image image) {
        image.setBuilding(this);
        images.add(image);
    }
}
