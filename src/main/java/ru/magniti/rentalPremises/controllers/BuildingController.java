package ru.magniti.rentalPremises.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.magniti.rentalPremises.models.Building;
import ru.magniti.rentalPremises.services.BuildingServiceDB;
import ru.magniti.rentalPremises.services.BuildingServiceDao;

@Controller
@RequiredArgsConstructor // создаёт экземпляр для buildingService в конструкторе
public class BuildingController {
    private final BuildingServiceDB buildingService; // final, т.к. @RequiredArgsConstructor
    // должен понять, что экземпляр создаётся ток в конструкторе
    @GetMapping("/") // GET запрос, обрабатывает пустой адрес
    public String buildings(@RequestParam(name = "name", required = false) String name, Model model) { // model передаёт builings в buildings.ftlh
        model.addAttribute("buildings", buildingService.listBuildings(name));
        return "buildings"; // возвращает buildings.ftlh
    }
    @GetMapping("/building/{id}") // GET запрос, обрабатывает отдельное помещение
    public String buildingInfo(Model model, @PathVariable long id) {
        model.addAttribute("building", buildingService.getBuildingById(id));
        return "building-info"; // возвращает building-info.ftlh
    }
    @PostMapping("/building/create")// POST запрос, добавляет здание
    public String buildingCreate(Building building) {
        buildingService.saveBuilding(building);
        return "redirect:/"; // возвращает buildings.ftlh
    }
    @PostMapping("/building/delete/{id}")// POST запрос, удаляет здание
    public String buildingDelete(@PathVariable long id) {
        buildingService.deleteBuilding(id);
        return "redirect:/"; // возвращает buildings.ftlh
    }
}
