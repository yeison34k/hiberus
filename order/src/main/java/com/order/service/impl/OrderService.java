package com.order.service.impl;

import java.util.List;

import com.order.Entities.Order;

public interface OrderService {
	
	public List<Order> getOrders();
	
	public Order getOrder();
	
	public Order createOrder();
}
