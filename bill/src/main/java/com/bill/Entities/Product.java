package com.bill.Entities;

import java.math.BigDecimal;
import lombok.Data;

@Data
public class Product {
	private Long id;
	private int quantity;
	private BigDecimal cost;
	
	public Product(Long id, int quantity, BigDecimal cost) {
		this.id = id;
		this.quantity = quantity;
		this.cost = cost;
	}
}
