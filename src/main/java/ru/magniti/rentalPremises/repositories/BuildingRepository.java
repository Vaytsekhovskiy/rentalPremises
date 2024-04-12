package ru.magniti.rentalPremises.repositories;

import org.aspectj.apache.bcel.util.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import ru.magniti.rentalPremises.models.Building;

import java.util.List;

public interface BuildingRepository extends JpaRepository<Building, Long> { // основное понятие в Spring data jpa
    // наследуясь от JpaRepository мы получаем доступ к основным запросам к БД
    List<Building> findBuildingByName(String name); // автоматически реализовывает по логике названия
    List<Building> findBuildingByLocation(String location);
}
