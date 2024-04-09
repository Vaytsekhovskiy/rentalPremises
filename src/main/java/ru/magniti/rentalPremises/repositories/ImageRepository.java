package ru.magniti.rentalPremises.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.magniti.rentalPremises.models.Image;

import java.util.List;

public interface ImageRepository extends JpaRepository<Image, Long> { // основное понятие в Spring data jpa
    // наследуясь от JpaRepository мы получаем доступ к основным запросам к БД
    List<Image> findBuildingByName(String name); // автоматически реализовывает по логике названия
}
