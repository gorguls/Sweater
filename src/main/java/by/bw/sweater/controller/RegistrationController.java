package by.bw.sweater.controller;

import by.bw.sweater.domain.Role;
import by.bw.sweater.domain.User;
import by.bw.sweater.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/registration")
    public String registration() {
        return "/registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        //Проверяем, есть ли уже такой юзер который пытается зарегистрироваться
        User userFromDB = userRepo.findByUsername(user.getUsername());
        if (userFromDB != null) {
            model.put("message","User exists"); //сообщаем что такой пользователь есть и снова на регистрацию
            return "registration";
        }

        //Если такого пользователя ещё нет, то добавляем
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER)); //создаёт set с одним значением (??????)
        userRepo.save(user);

        return "redirect:/login";
    }
}
