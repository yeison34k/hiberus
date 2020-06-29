package com.logistic.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.logistic.Entities.SendOrder;
import com.logistic.dao.SendOrderDao;
import com.logistic.service.LogisticService;

@Service
public class LogisticServiceImpl implements LogisticService {

	@Autowired
	private SendOrderDao sendOrderDao;

	@Autowired
	private MongoTemplate mongoTemplate;

	@Override
	public List<SendOrder> getSendOrders() {
		return sendOrderDao.findAll();
	}

	@Override
	public Optional<SendOrder> getSendOrder(String id) {
		Query query = new Query(Criteria.where("orden").is(id));
		Optional<SendOrder> sendOrder = mongoTemplate.find(query, SendOrder.class).stream().findFirst();
		return sendOrder;
	}

	@Override
	public SendOrder createSendOrder(SendOrder order) {
		return sendOrderDao.insert(order);
	}
}
