package ru.magniti.rentalPremises.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.magniti.rentalPremises.models.User;
import ru.magniti.rentalPremises.models.enums.Role;
import ru.magniti.rentalPremises.repositories.UserRepository;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService implements UserDetailsService {// имплементируя SAM, мы получаем возможность загружать
    // нового юзера по username
    private final UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return userRepository.findUserByEmail(email).orElseThrow(() -> new UsernameNotFoundException(email + "not found"));
    }
    public boolean createUser(User user){
        String email = user.getEmail();
        System.out.println("----------------------------------");
        if (userRepository.findUserByEmail(email).isPresent()) return false;
        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER);
        log.info("Saving new user with email: {}", email);
        userRepository.save(user);
        return true;
    }
}
