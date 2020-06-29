package com.payment.service;

import java.util.Map;

import com.payment.Entities.OrderBillRequest;

public interface PaymentService {

	public Map<String, Object> payment(OrderBillRequest order);
}
