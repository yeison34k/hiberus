package com.order.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.order.Entities.Order;
import com.order.dao.OrderDao;
import com.order.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao orderDao; 
	
	@Override
	public List<Order> getOrders() {
		return orderDao.findAll();
	}

	@Override
	public Optional<Order> getOrder(Long id) {
		return orderDao.findById(id);
	}

	@Override
	public Order createOrder(Order order) {
		return orderDao.insert(order);
	}
}