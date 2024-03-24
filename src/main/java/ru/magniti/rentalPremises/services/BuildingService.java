package ru.magniti.rentalPremises.services;

import ru.magniti.rentalPremises.models.Building;

public interface BuildingService { // базовый интерфейс, от него будет наследоваться класс, который работает с БД
    void saveBuilding(Building building);
    void deleteBuilding(long id);
    Building getBuildingById(long id);
}
