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
import ru.magniti.rentalPremises.services.UserService;

import java.io.IOException;
import java.security.Principal;

@Slf4j
@Controller
@RequiredArgsConstructor // создаёт экземпляр для buildingService в конструкторе
public class BuildingController {
    private final BuildingService buildingService; // final, т.к. @RequiredArgsConstructor
    // должен понять, что экземпляр создаётся ток в конструкторе
    private final UserService userService;
    @GetMapping("/") // GET запрос, обрабатывает пустой адрес
    public String buildings(
            @RequestParam(name = "name", required = false) String name,
            @RequestParam(name = "location", required = false) String location,
            @RequestParam(name = "price", required = false) Integer price,
            @RequestParam(name="approved", required = false) Boolean approved,
            Model model,
            Principal principal
    )
    { // model передаёт builings в buildings.ftlh
        model.addAttribute("user", buildingService.getUserByPrincipal(principal));
        model.addAttribute("buildings", buildingService.listBuildings(name, location, price, approved));
        return "buildings"; // возвращает buildings.ftlh
    }
    @GetMapping("/building/{id}") // GET запрос, обрабатывает отдельное помещение
    public String buildingInfo(Model model, @PathVariable long id, Principal principal) {
        model.addAttribute("building", buildingService.getBuildingById(id));
        model.addAttribute("images", buildingService.getBuildingById(id).getImages());
        model.addAttribute("user", buildingService.getUserByPrincipal(principal));
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
    public String buildingDelete(@PathVariable long id, Principal principal) {
        buildingService.deleteBuilding(id, buildingService.getUserByPrincipal(principal));
        return "redirect:/"; // возвращает buildings.ftlh
    }
    @PostMapping("/building/approved/{id}") // POST запрос, на изменение статуса
    public String buildingApproved(@PathVariable long id,
                                   @RequestParam(name="approved", required = false) Boolean approved,
                                   Principal principal){
        buildingService.changeBuildingStatus(id, approved, buildingService.getUserByPrincipal(principal));
        return  "redirect:/";
    }
}