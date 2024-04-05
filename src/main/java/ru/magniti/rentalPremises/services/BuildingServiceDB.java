package ru.magniti.rentalPremises.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.magniti.rentalPremises.models.Building;
import ru.magniti.rentalPremises.repositories.BuildingRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j // логирование
public class BuildingServiceDB implements BuildingService{
    private final BuildingRepository buildingRepository;

    @Override
    public void saveBuilding(Building building) {
        log.info("Saving building: {}", building);
        buildingRepository.save(building);
    }

    @Override
    public void deleteBuilding(long id) {
        buildingRepository.deleteById(id);
    }

    @Override
    public Building getBuildingById(long id) {
        return buildingRepository.findById(id).orElse(null);
    }

    @Override
    public List<Building> listBuildings(String name) {
        if (name == null) return buildingRepository.findAll();
        return buildingRepository.findBuildingByName(name);
    }
}
