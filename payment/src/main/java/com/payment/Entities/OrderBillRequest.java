package com.payment.Entities;

import java.io.Serializable;

import lombok.Data;

@Data
public class OrderBillRequest implements Serializable  {
	private static final long serialVersionUID = -2905034600462868393L;
	
	private Bill bill;
	private Order order;
	
	public OrderBillRequest() {}
	
	public OrderBillRequest(Bill bill, Order order) {
		this.bill = bill;
		this.order = order;
	}
}
