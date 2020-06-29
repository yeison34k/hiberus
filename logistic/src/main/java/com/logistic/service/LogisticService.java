package com.logistic.service;

import java.util.List;
import java.util.Optional;

import com.logistic.Entities.SendOrder;

public interface LogisticService {

	public List<SendOrder> getSendOrders();

	public Optional<SendOrder> getSendOrder(String id);

	public SendOrder createSendOrder(SendOrder order);
}
