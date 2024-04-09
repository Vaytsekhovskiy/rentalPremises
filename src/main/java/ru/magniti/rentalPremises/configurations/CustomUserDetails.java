package ru.magniti.rentalPremises.configurations;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import ru.magniti.rentalPremises.models.User;
import ru.magniti.rentalPremises.services.CustomUserDetailsService;

import java.util.Collection;

public class CustomUserDetails implements UserDetails {
    private User user;
    public CustomUserDetails(User user) {
        this.user = user;
    }
    // security
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return user.getRoles(); // Role должно имплементировать GrantedAuthority
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

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
        return user.isActive();
    }
}
