package com.groupninja.himi.pizza_ninja.controllers;

import com.groupninja.himi.pizza_ninja.models.Order;
import com.groupninja.himi.pizza_ninja.models.User;
import com.groupninja.himi.pizza_ninja.services.OrderService;
import com.groupninja.himi.pizza_ninja.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
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
   @PostMapping("order")
    public String orderPizza(@Valid @ModelAttribute("order") Order order, Principal principal, BindingResult result){
       String username = principal.getName();
       User user = userService.findByUsername(username);
       if (result.hasErrors()){
           return "/user/order";
       } else {
           order.setUser(user);
           this.orderService.saveOrEdit(order);
           return "redirect:/";
       }
   }
}
