package ru.magniti.rentalPremises.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.magniti.rentalPremises.models.Building;
import ru.magniti.rentalPremises.services.BuildingService;

import java.io.IOException;
import java.security.Principal;

@Slf4j
@Controller
@RequiredArgsConstructor // создаёт экземпляр для buildingService в конструкторе
public class BuildingController {
    private final BuildingService buildingService; // final, т.к. @RequiredArgsConstructor
    // должен понять, что экземпляр создаётся ток в конструкторе
    @GetMapping("/") // GET запрос, обрабатывает пустой адрес
    public String buildings(
            @RequestParam(name = "name", required = false) String name,
            @RequestParam (name = "location", required = false) String location,
            @RequestParam (name = "price", required = false) Integer price,
                            Model model,
                            Principal principal
            )
    {
        model.addAttribute("buildings", buildingService.listBuildings(name, location, price));
        model.addAttribute("user", buildingService.getUserByPrincipal(principal));
        return "buildings"; // возвращает buildings.ftlh
    }
    @GetMapping("/building/{id}") // GET запрос, обрабатывает отдельное помещение
    public String buildingInfo(Model model, @PathVariable long id) {
        model.addAttribute("building", buildingService.getBuildingById(id));
        model.addAttribute("images", buildingService.getBuildingById(id).getImages());
        return "building-info"; // возвращает building-info.ftlh
    }
    @PostMapping("/building/create")// POST запрос, добавляет здание
    public String buildingCreate(
            @RequestParam("frontFile") MultipartFile frontFile,
            @RequestParam("entranceFile") MultipartFile entranceFile,
            @RequestParam("interiorFile") MultipartFile interiorFile,
            Building building,
            Principal principal
    ) throws IOException
    {
        log.info("BuildingController.buildingCreate");
        buildingService.saveBuilding(principal, building, frontFile, entranceFile, interiorFile);
        log.info("BuildingController.buildingCreate is done");
        return "redirect:/"; // возвращает buildings.ftlh
    }
    @PostMapping("/building/delete/{id}")// POST запрос, удаляет здание
    public String buildingDelete(@PathVariable long id) {
        buildingService.deleteBuilding(id);
        return "redirect:/"; // возвращает buildings.ftlh
    }
}
