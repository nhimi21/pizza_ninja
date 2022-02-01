package com.groupninja.himi.pizza_ninja.services;

import com.groupninja.himi.pizza_ninja.models.Order;
import com.groupninja.himi.pizza_ninja.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public List<Order> findAllOrders(){
        return this.orderRepository.findAll();
    }
    public Order getOneOrder(Long id){
        return this.orderRepository.findById(id).orElse(null);
    }
    public void saveOrEdit(Order order){
        this.orderRepository.save(order);
    }
    public void deleteOrder(Long id) {
        boolean exists = orderRepository.existsById(id);
        if (!exists){
            throw new IllegalStateException("Order with id" + id + "does not exists");
        }
        this.orderRepository.deleteById(id);
    }

}
