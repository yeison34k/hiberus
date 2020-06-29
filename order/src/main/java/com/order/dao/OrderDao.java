package com.order.dao;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.order.Entities.Order;

public interface OrderDao extends MongoRepository<Order, Long> {

}