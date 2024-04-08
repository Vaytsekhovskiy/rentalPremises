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
public class User implements UserDetails { // имплементируя UserDetails мы показываем Spring Security, что
    // с помощью модели User мы будем авторизироваться (брать мэйл, пароль и т. д.)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "username")
    private String username;
    @Column(name = "password")
    private String password;
    @Column(name = "phone_number")
    private String phone_number;
    @Column(name = "email")
    private String email;
    @Column(name = "inn")
    private Long inn;
    @Column(name = "active")
    private boolean active;
    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER) // позволяет хранить коллекции
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id")) // указываем название таблицы,
    // внешний ключ
    @Enumerated(EnumType.STRING) // все роли будут хранится в виде строки
    private Set<Role> roles = new HashSet<>();

    // security
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles; // Role должно имплементировать GrantedAuthority
    }

    @Override
    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return email;
    }
//    public void setPhoneNumber(String phoneNumber) {
//        this.phone_number = phoneNumber;
//    }
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return active;
    }
}
