package ru.magniti.rentalPremises.services;

import lombok.Getter;
import org.springframework.stereotype.Service;
import ru.magniti.rentalPremises.models.Building;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingServiceDao implements BuildingService{ // реализация сохранения не в БД, а во внутренней памяти
    @Getter
    private final List<Building> buildings = new ArrayList<>();
    private long id = 0;
    {
        buildings.add(new Building(id++, "Помещение у политеха",
                "г. Санкт-Петербург, ул. Политехническая, д. 17", 150000, "О.М. Тарасов", "Раньше была художественной галереей"));
        buildings.add(new Building(id++, "Дом на неве",
                "г. Санкт-Петербург, ул. Невская, д. 5", 200000, "Д.Д. Боронин", "Помещение 10х10м, здесь расположен склад жвачки"));
    }
    @Override
    public void saveBuilding(Building building) {
        building.setId(id++);
        buildings.add(building);
    }

    @Override
    public void deleteBuilding(long id) {
        buildings.removeIf(building -> building.getId() == id);
    }

    @Override
    public Building getBuildingById(long id) {
        for (Building building : buildings) {
            if (building.getId() == id) return building;
        }
        return null;
    }
}
