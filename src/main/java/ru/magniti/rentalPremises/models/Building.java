package ru.magniti.rentalPremises.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.magniti.rentalPremises.models.enums.buildingType;

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
    @Column(name = "strLocation") // местоположение в виде строки от юзера в свободной форме, храним на всякий
    private String strLocation;
    // детальное местоположение:
    @Column(name = "lat")
    private double lat;
    @Column(name = "lon")
    private double lon;
    @Column(name = "country")
    private String country;
    @Column(name = "state") // субъект рф (по номенклатуре OSM)
    private String state;
    @Column(name = "county") // район субъекта рф (по номенклатуре OSM)
    private String county;
    @Column(name = "city")
    private String city;
    @Column(name = "road")
    private String road;
    @Column(name = "buildingNo")
    private String buildingNo;
    @Column(name = "type")
    @Enumerated(EnumType.STRING)
    private buildingType type;
    @Column(name = "floor")
    private String floor; // стринг на случай если где-то есть этаж 1A и 1B
    @Column(name = "roomNo")
    private String roomNo;
    // ...
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
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
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
