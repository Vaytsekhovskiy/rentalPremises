package ru.magniti.rentalPremises.services;

import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import ru.magniti.rentalPremises.models.Building;
import ru.magniti.rentalPremises.models.Image;
import ru.magniti.rentalPremises.models.User;
import ru.magniti.rentalPremises.repositories.BuildingRepository;
import ru.magniti.rentalPremises.repositories.UserRepository;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j // логирование
@Transactional
public class BuildingService {
    private final BuildingRepository buildingRepository;
    private final UserRepository userRepository;
    private final EntityManager entityManager;

    public void saveBuilding(Principal principal, Building building, MultipartFile frontFile,
                             MultipartFile entranceFile, MultipartFile interiorFile) throws IOException { // MultipartFile - внутри фотки
        // будем принимать три фото: фасад здания, вход, интерьер
        // principal - передаёт состояние пользователя в приложении (некоторая обёртка)
        building.setUser(getUserByPrincipal(principal));
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
        if (interiorFile.getSize() != 0) {
            interior = toImageEntity(interiorFile);
            building.addImageToProduct(interior);
        }
        log.info("Saving building: name = {}, owner = {}", building.getName(), building.getUser().getUsername());
        Building buildingFromDB = buildingRepository.save(building);
        buildingFromDB.setPreviewImageId(buildingFromDB.getImages().get(0).getId());
        buildingRepository.save(building);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findUserByUsername(principal.getName()).orElse(new User());
        // хз что возвращает principal.getName() - name or username?
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
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

    public List<Building> listBuildings(String name, String location, Integer price) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Building> query = criteriaBuilder.createQuery(Building.class);
        Root<Building> root = query.from(Building.class);
        List<Predicate> predicates = new ArrayList<>();
        if (name != null && !StringUtils.isEmpty(name)) { // Импортируйте StringUtils из org.springframework.util
            predicates.add(criteriaBuilder.equal(root.get("name"), name));
        }
        if (location != null && !StringUtils.isEmpty(location)) {
            predicates.add(criteriaBuilder.equal(root.get("location"), location));
        }
        if (price != null){
            predicates.add(criteriaBuilder.lessThanOrEqualTo(root.get("price"), price));
        }
        query.select(root).where(predicates.toArray(new Predicate[0]));
        return entityManager.createQuery(query).getResultList();
    }
}