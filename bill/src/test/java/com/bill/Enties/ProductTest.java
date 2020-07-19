package com.bill.Enties;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.math.BigDecimal;

import org.junit.jupiter.api.Test;

import com.bill.Entities.Product;

public class ProductTest {
	
	private Long id = 1l;
	private int quantity = 10;
	private BigDecimal cost = new BigDecimal(100.0);
	
	
	@Test
	public void valid_constructor() {
		Product product = new Product(id, quantity, cost);
		assertNotNull(product);
	}
}
