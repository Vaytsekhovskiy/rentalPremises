package ru.magniti.rentalPremises.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.magniti.rentalPremises.models.Building;
import ru.magniti.rentalPremises.models.Image;
import ru.magniti.rentalPremises.repositories.BuildingRepository;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j // логирование
public class BuildingService {
    private final BuildingRepository buildingRepository;

    public void saveBuilding(Building building, MultipartFile frontFile,
                             MultipartFile entranceFile, MultipartFile interiorFile) throws IOException { // MultipartFile - внутри фотки
        // будем принимать три фото: фасад здания, вход, интерьер
        Image front;
        Image entrance;
        Image interior;
        if (frontFile.getSize() != 0) {
            front = toImageEntity(frontFile);
            front.setPreviewImage(true);
            building.addImageToProduct(front);
        }
        if (entranceFile.getSize() != 0) {
            entrance = toImageEntity(entranceFile);
            building.addImageToProduct(entrance);
        }
        if (frontFile.getSize() != 0) {
            interior = toImageEntity(interiorFile);
            interior.setPreviewImage(true);
            building.addImageToProduct(interior);
        }
        log.info("Saving building: name = {}, owner = {}", building.getName(), building.getOwner());
        Building buildingFromDB = buildingRepository.save(building);
        buildingFromDB.setPreviewImageId(buildingFromDB.getImages().get(0).getId());
        buildingRepository.save(building);
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteBuilding(long id) {
        buildingRepository.deleteById(id);
    }

    public Building getBuildingById(long id) {
        return buildingRepository.findById(id).orElse(null);
    }

    public List<Building> listBuildings(String name) {
        if (name == null) return buildingRepository.findAll();
        return buildingRepository.findBuildingByName(name);
    }
}
