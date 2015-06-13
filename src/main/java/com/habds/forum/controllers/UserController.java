package com.habds.forum.controllers;

import com.habds.forum.Theme;
import com.habds.forum.User;
import com.habds.forum.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping("/personal_page")
    public String personalPage(Map<String, Object> map) {
        User user = userService.getLoggedInUser();
        map.put("userComments", user.getComments());
        map.put("userThemes", user.getThemes());
        map.put("currentUser", user);
        return "user_page";
    }

    @RequestMapping("/user/{username}")
    public String userPage(@PathVariable String username, Map<String, Object> map) {
        User user = userService.getUser(username);
        map.put("user", user);
        map.put("userComments", user.getComments());
        map.put("userThemes", user.getThemes());
        return "user";
    }

    @RequestMapping("/registration")
    public String registration() {
        return "registration";
    }


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user,
                          BindingResult result) {

        userService.addUser(user);
        return "redirect:/login";
    }

    @RequestMapping("/delete/{userId}")
    public String deleteUser(@PathVariable("userId") Integer userId) {

        userService.removeUser(userId);

        return "redirect:/index";
    }
}
