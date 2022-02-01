package com.groupninja.himi.pizza_ninja.controllers;

import com.groupninja.himi.pizza_ninja.models.User;
import com.groupninja.himi.pizza_ninja.repositories.RoleRepository;
import com.groupninja.himi.pizza_ninja.services.UserService;
import com.groupninja.himi.pizza_ninja.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    public UserValidator userValidator;
    @Autowired
    private RoleRepository roleRepository;

    @RequestMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "/auth/register";
    }

    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "/auth/register";
        }
        User u = userService.saveWithUserRole(user);
        session.setAttribute("userId", u.getId());
        return "redirect:/";
    }

    @RequestMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout, Model model) {
        if (error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials!");
        }
        if (logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "/auth/login";
    }

    @PostMapping(value = "/login")
    public String loginUser(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            Model model, HttpSession session) {
        boolean isAuthenticated = userService.authenticateUser(username, password);
        if (isAuthenticated) {
            User user = userService.findByUsername(username);
            session.setAttribute("userId", user.getId());
        }
        return "redirect:/";
    }

    @RequestMapping("/")
    public String homeUser(Principal principal, Model model, HttpSession session) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        return "/user/homeUser";
    }

    @GetMapping("/account/{id}")
    public String edit(@PathVariable("id") Long id, Principal principal, Model model){
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        model.addAttribute("users",this.userService.findUserById(id));
        return "/user/account";
    }
    @PutMapping("/account/{id}")
    public String editAccount(@Valid @ModelAttribute("users") User users, BindingResult result, Model model, HttpSession session) {
        userValidator.validate(users, result);
        if (result.hasErrors()) {
            return "/user/account";
        }
        User u = userService.saveWithUserRole(users);
        session.setAttribute("userId", u.getId());
        return "redirect:/";
    }

}
