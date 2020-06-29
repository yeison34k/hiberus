package com.payment.Entities;

import lombok.Data;

@Data
public class OrderBillRequest {
	private Bill bill;
	private Order order;
	
	public OrderBillRequest() {}
	
	public OrderBillRequest(Bill bill, Order order) {
		this.bill = bill;
		this.order = order;
	}
}
