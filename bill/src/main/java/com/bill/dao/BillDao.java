package com.bill.dao;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.bill.Entities.Bill;

public interface BillDao extends MongoRepository<Bill, Long> {

}
