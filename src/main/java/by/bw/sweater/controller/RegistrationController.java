package by.bw.sweater.controller;

import by.bw.sweater.domain.User;
import by.bw.sweater.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration() {
        return "/registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        if (!userService.addUser(user)) {
            model.put("message", "Такой пользователь существует");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/activation/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        System.out.println(code);

        if (isActivated) {
            model.addAttribute("message", "Пользователь активирован");
        } else {
            model.addAttribute("message", "Код активации не найден");
        }

        return "login";
    }
}
