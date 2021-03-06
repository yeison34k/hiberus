package com.order.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.order.Entities.Order;
import com.order.service.OrderService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@Api(value = "Orders microservice", description = "This API has method get orders")
public class OrderController {

	final static Logger logger = Logger.getLogger(OrderController.class);

	@Autowired
	private OrderService orderService;

	@GetMapping(value = "/orders", produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation(value = "Find all Orders", notes = "Return all Orders")
	public List<Order> getOrders() {
		return orderService.getOrders();
	}

	@GetMapping(value = "/order/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation(value = "Find one Order", notes = "Return Order")
	public Order getOrder(@PathVariable Long id) {
		return orderService.getOrder(id).orElse(null);
	}

	@PostMapping(value = "/order/create", produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation(value = "Create new Order", notes = "Return Order")
	public Order createOrder(@RequestBody Order order) {
		return orderService.createOrder(order);

	}
}