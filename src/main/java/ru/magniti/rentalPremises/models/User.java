package ru.magniti.rentalPremises.models;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import ru.magniti.rentalPremises.models.enums.Role;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
@Data
public class User{ // имплементируя UserDetails мы показываем Spring Security, что
    // с помощью модели User мы будем авторизироваться (брать мэйл, пароль и т. д.)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "inn")
    private Long inn;
    @Column(name = "username")
    private String username;
    @Column(name = "numberPhone", unique = true)
    private String numberPhone;
    @Column(name = "name")
    private String name;
    @Column(name = "active")
    private boolean active;
    @Column(name = "password")
    private String password;
    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER) // позволяет хранить коллекции
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id")) // указываем название таблицы,
    // внешний ключ
    @Enumerated(EnumType.STRING) // все роли будут хранится в виде строки
    private Set<Role> roles = new HashSet<>();
}
