package com.groupninja.himi.pizza_ninja.controllers;

import com.groupninja.himi.pizza_ninja.models.Order;
import com.groupninja.himi.pizza_ninja.services.OrderService;
import com.groupninja.himi.pizza_ninja.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.security.Principal;

@Controller
public class OrderController {
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;

   @GetMapping("/order")
    public  String order(@ModelAttribute("order")Order order, Principal principal, Model model){
       String username = principal.getName();
       model.addAttribute("currentUser", userService.findByUsername(username));
       return "/user/order";
   }
}
