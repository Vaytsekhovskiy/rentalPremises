package ru.magniti.rentalPremises.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.magniti.rentalPremises.models.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findUserByUsername(String username);
    Optional<User> findUserByEmail(String email);
}
