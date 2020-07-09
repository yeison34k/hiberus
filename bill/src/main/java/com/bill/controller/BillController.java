package com.bill.controller;

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

import com.bill.Entities.Bill;
import com.bill.service.BillService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@Api(value = "Bill microservice", description = "This API has method bills")
public class BillController {

	final static Logger logger = Logger.getLogger(BillController.class);

	@Autowired
	private BillService orderService;

	@GetMapping(value = "/orders", produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation(value = "Find all Bills", notes = "Return all Bills")
	public List<Bill> getBills() {
		return orderService.getBills();
	}

	@GetMapping(value = "/order/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation(value = "Find one Bill", notes = "Return Bill")
	public Bill getOrder(@PathVariable Long id) {
		return orderService.getBill(id).orElse(null);
	}

	@PostMapping(value = "/bill/create", produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation(value = "Create new Bill", notes = "Return Bill ")
	public Bill createOrder(@RequestBody Bill bill) {
		return orderService.createBill(bill);
	}
}
