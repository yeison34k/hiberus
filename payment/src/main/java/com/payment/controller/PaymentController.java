package com.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.payment.Entities.Order;
import com.payment.Entities.Product;
import com.payment.service.PaymentService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


@RestController()
@Api(value = "Products microservice", description = "This API has method get products")
public class PaymentController {
	
	final static Logger logger = Logger.getLogger(PaymentController.class);
	
	@Autowired
    private  PaymentService paymentService;
	
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	@ApiOperation(value = "Pay, generate bill and send order", notes = "Return all Products" )
	public Map<String, Object> payment(@RequestBody Order order) {
		return paymentService.payment(order);
    }
	
	
	
	
}
