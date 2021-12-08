//Ctrl + Alt + O Убратьненужные импорты
package by.bw.sweater.config;

import by.bw.sweater.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserService userService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/", "/static/**", "/activation/*","/registration").permitAll() //Matcher - сопоставитель
                .anyRequest().authenticated()
            .and()
                .formLogin() //включаем форму логина
                .loginPage("/login") //указываем, что логин происходит по этому меппингу
                .permitAll()
            .and()
                .logout() //включаем логаут
                .permitAll(); //разрешаем логаут всем
//        1. чтобы после логаута попасть на главную страницу, нужно после строчки .logout() в WebSecurityConfig
//        дописать строчку .logoutSuccessUrl("/").
//        2. чтобы не дублировать "/registration" в аннотациях GetMapping и PostMapping в RegistrationController,
//        можно на этот класс навесить аннотацию @RequestMapping("/registration").

    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception { //Построитель авторизациипереписываем стандартный обработчик
        auth.userDetailsService(userService)
                .passwordEncoder(NoOpPasswordEncoder.getInstance());
    }
}