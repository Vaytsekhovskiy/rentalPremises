package ru.magniti.rentalPremises.services;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.magniti.rentalPremises.models.User;
import ru.magniti.rentalPremises.models.enums.Role;
import ru.magniti.rentalPremises.repositories.UserRepository;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
@Transactional
public class UserService {
        private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    public boolean createUser(User user) {
        String userEmail = user.getUsername();
        if (userRepository.findUserByUsername(userEmail).isPresent()) return false;
        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER); // здесь можно поменять на ROLE_ADMIN
        //user.setPassword(user.getPassword());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Saving new User with email: {}", userEmail);
        userRepository.save(user);
        return true;
    }
    public List<User> list() {
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
                if (user.isActive()) {
                    user.setActive(false);
                    log.info("User with id = {}; email = {} was banned", user.getId(), user.getUsername());
                }
                else {
                    user.setActive(true);
                    log.info("User with id = {}; email = {} was unbanned", user.getId(), user.getUsername());
                }
                userRepository.save(user); // обновляем информацию о пользователе
        }
        else log.info("User with id = {}; email = {} is not existed", user.getId(), user.getUsername());
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }
}
