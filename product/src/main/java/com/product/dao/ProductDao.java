package com.product.dao;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.product.Entities.Product;

public interface ProductDao extends MongoRepository<Product, Long> {

}
