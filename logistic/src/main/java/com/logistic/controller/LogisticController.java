package com.logistic.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.logistic.Entities.SendOrder;
import com.logistic.service.LogisticService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


@RestController
@Api(value = "Orders microservice", description = "This API has method get orders")
public class LogisticController {
	
	final static Logger logger = Logger.getLogger(LogisticController.class);
	
	@Autowired
    private  LogisticService logisticService;
	
	@GetMapping(value = "/sends", produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation(value = "Find all Orders", notes = "Return all Orders" )
	public List<SendOrder> getOrders() {
		return logisticService.getSendOrders();
    }
	
	@GetMapping(value = "/send/{orderId}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation(value = "Find one Order", notes = "Return Order" )
	public SendOrder getOrder(@PathVariable String id) {
		return logisticService.getSendOrder(id).orElse(null);
    }
	
	@PostMapping(value = "/send/create", produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation(value = "Create new Order", notes = "Return Order" )
	public SendOrder createOrder(@RequestBody SendOrder order) {
		return logisticService.createSendOrder(order);
    }
}
