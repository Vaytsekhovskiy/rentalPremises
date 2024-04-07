package ru.magniti.rentalPremises.configurations;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.SecurityFilterChain;
import ru.magniti.rentalPremises.services.UserService;

@Configuration // указывает спрингу, что в методах @Bean будут создаваться новые экземпляры, которые надо добавить в бины
@EnableWebSecurity // позволяет включить поддержку веб-безопасности Spring Security и обеспечить интеграцию Spring MVC
@RequiredArgsConstructor
public class SecurityConfig{
    private final UserService userService;
    // цепочка фильтров для незарегистрированных пользователей
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(requests -> requests
                        .requestMatchers("/", "/building/**", "/registration").permitAll() // можно добавить больше стрингов
                        .anyRequest().authenticated()
                )
                .formLogin((form) -> form
                        .loginPage("/login")
                        .permitAll()
                )
                .logout(LogoutConfigurer::permitAll)
                .csrf(csrf -> csrf.ignoringRequestMatchers("/registration")); // Игнорируем CSRF для /registration
// необходимо потом реализовать csrf токен
        return http.build();
    }

    // создать пользователя и сохранить его в приложении
    @Bean
    public UserDetailsService userDetailsService() {
        // Passowrd Encoder - интерфейс,
        // использующаяя для одностороннего преобразования пароля

        return userService; // класс,
        // использованный для хранения и управления всеми пользователями
    }

}