package com.logistic.dao;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.logistic.Entities.SendOrder;

public interface SendOrderDao extends MongoRepository<SendOrder, Long> {

}
