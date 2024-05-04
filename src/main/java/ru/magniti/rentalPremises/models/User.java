package ru.magniti.rentalPremises.models;

import jakarta.persistence.*;
import lombok.Data;
import ru.magniti.rentalPremises.models.enums.Role;
import ru.magniti.rentalPremises.converters.CryptoAttributeConverter;

import java.util.*;

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
    @Convert(converter = CryptoAttributeConverter.class)
    @Column(name = "numberPhone", unique = true)
    private String numberPhone;
    @Convert(converter = CryptoAttributeConverter.class)
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

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
    private List<Building> buildings = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
    private List<Log> logs = new ArrayList<>();
    public boolean isAdmin(){
        return getRoles().contains(Role.ROLE_ADMIN);
    }
    public void addLog(String description){
        Log log = new Log();
        log.setUser(this);
        log.setDescription(description);
        logs.add(log);
    }
}
