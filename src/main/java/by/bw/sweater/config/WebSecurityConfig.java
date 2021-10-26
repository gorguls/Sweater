//Ctrl + Alt + O Убратьненужные импорты
package by.bw.sweater.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private DataSource dataSource; //DataSource генерируется Spring здесь мы его получаем
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                    .antMatchers("/", "/registration").permitAll() //Matcher - сопоставитель
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
        auth.jdbcAuthentication()
                .dataSource(dataSource)
                .passwordEncoder(NoOpPasswordEncoder.getInstance())
                .usersByUsernameQuery("select username, password, active from usr where username=?")
                .authoritiesByUsernameQuery("select u.username, ur.roles from usr u inner join user_role ur on u.id = ur.user_id where u.username = ? ");
    }
}