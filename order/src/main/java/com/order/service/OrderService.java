package com.order.service;

import java.util.List;
import java.util.Optional;

import com.order.Entities.Order;

public interface OrderService {
	
	public List<Order> getOrders();
	
	public Optional<Order> getOrder(Long id);
	
	public Order createOrder(Order order);
}
