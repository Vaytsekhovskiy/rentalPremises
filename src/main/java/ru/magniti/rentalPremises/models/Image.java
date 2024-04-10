package ru.magniti.rentalPremises.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.autoconfigure.info.ProjectInfoProperties;

@Entity // показывает, что класс является референсом к бд
@Table(name = "images") // задаём имя таблицы
@Data // геттеры, сеттеры, equals, hashCode, canEqual, toString
@AllArgsConstructor
@NoArgsConstructor
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "originalFileName")
    private String originalFileName;
    @Column(name = "size")
    private Long size;
    @Column(name = "contentType")
    private String contentType;
    @Column(name = "isPreviewImage")
    private boolean isPreviewImage;
    @Lob // будет хранить данную колонку в типе longBlob
    private byte[] bytes;

    // создаём отношение один ко многим
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER) // т.к. пользователь один
    private Building building;

}
