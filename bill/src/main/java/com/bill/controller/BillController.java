package com.bill.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
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

	@RequestMapping(value = "/orders", method = RequestMethod.GET)
	@ApiOperation(value = "Find all Bills", notes = "Return all Bills")
	public List<Bill> getBills() {
		return orderService.getBills();
	}

	@RequestMapping(value = "/order/{id}", method = RequestMethod.GET)
	@ApiOperation(value = "Find one Bill", notes = "Return Bill")
	public Bill getOrder(@PathVariable Long id) {
		return orderService.getBill(id).orElse(null);
	}

	@PostMapping(value = "/bill/create")
	@ApiOperation(value = "Create new Bill", notes = "Return Bill ")
	public Bill createOrder(@RequestBody Bill bill) {
		return orderService.createBill(bill);
	}
}
