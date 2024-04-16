package ru.magniti.rentalPremises.services;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.magniti.rentalPremises.configurations.CustomUserDetails;
import ru.magniti.rentalPremises.models.User;
import ru.magniti.rentalPremises.repositories.UserRepository;

import java.util.Optional;

@Service
@Slf4j
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Transactional // нужно для получения LoB объектов через user безопасно
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("CustomUserDetailsService.loadUserByUserName()");
        Optional<User> user = userRepository.findUserByUsername(username);
        log.info("CustomUserDetailsService.loadUserByUserName(). User with email: {} was found", username);
        return user.map(CustomUserDetails::new).orElseThrow(() -> new UsernameNotFoundException(username + "not found"));
    }
}