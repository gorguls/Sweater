package by.bw.sweater.service;

import by.bw.sweater.domain.Role;
import by.bw.sweater.domain.User;
import by.bw.sweater.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private MailSender mailSender;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public boolean addUser(User user){
        //Проверяем, есть ли уже такой юзер который пытается зарегистрироваться
        User userFromDB = userRepo.findByUsername(user.getUsername());
        if (userFromDB != null) {
            return false;
        }

        //Если такого пользователя ещё нет, то добавляем
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER)); //создаёт set с одним значением (??????)
        user.setActivationCode(UUID.randomUUID().toString());
        user.setActive(false);
        userRepo.save(user);

        if ( !StringUtils.isEmpty(user.getEmail()) ) {
            String message = String.format(
                    "Здравствуйте, %s! \n" +
                            "Для активации перейдите: http://localhost:8080/activation/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );
            mailSender.send(user.getEmail(), "Код активации", message);
        }
    return true;
    }

    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);
        if (user == null){
            return false;
        }

        user.setActivationCode(null);
        userRepo.save(user);

        return true;
    }
}
