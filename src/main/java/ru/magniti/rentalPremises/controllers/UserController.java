package ru.magniti.rentalPremises.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.magniti.rentalPremises.models.User;
import ru.magniti.rentalPremises.services.UserService;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {
    private final UserService userService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }
    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }
    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        log.info("post, registration, createUser");
        if (!userService.createUser(user)) {
            log.info("user {} is already exist", user.getUsername());
            model.addAttribute("errorMessage", "Пользователь с таким email уже существует");
            return "registration";
        }
        return "redirect:/login";
    }
    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("buildings", user.getBuildings());
        return "user-info";
    }
}