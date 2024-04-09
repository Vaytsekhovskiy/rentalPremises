package ru.magniti.rentalPremises.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.magniti.rentalPremises.models.User;
import ru.magniti.rentalPremises.models.enums.Role;
import ru.magniti.rentalPremises.repositories.UserRepository;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
        private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    public boolean createUser(User user) {
        String userEmail = user.getUsername();
        if (userRepository.findUserByUsername(userEmail).isPresent()) return false;
        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER);
        //user.setPassword(user.getPassword());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Saving new User with email: {}", userEmail);
        userRepository.save(user);
        return true;
    }
}
