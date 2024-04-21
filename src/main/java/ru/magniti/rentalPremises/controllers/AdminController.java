package ru.magniti.rentalPremises.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.magniti.rentalPremises.models.User;
import ru.magniti.rentalPremises.models.enums.Role;
import ru.magniti.rentalPremises.services.BuildingService;
import ru.magniti.rentalPremises.services.UserService;

import java.security.Principal;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor // создаёт экземпляр для buildingService в конструкторе
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;
    private final BuildingService buildingService;

    @GetMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("users", userService.list());
        return "admin";
    }
    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id, Principal principal) {
        userService.banUser(id, buildingService.getUserByPrincipal(principal));
        return "redirect:/admin";
    }
    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }
    @PostMapping("/admin/user/edit")
    public String userEdit
            (
                    @RequestParam("userId") User user,
                    @RequestParam Map<String, String> form,
                    Principal principal
            ) {
        userService.changeUserRoles(user, form, buildingService.getUserByPrincipal(principal));
        return "redirect:/admin";
    }
}
