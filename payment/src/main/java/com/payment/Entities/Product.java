package com.payment.Entities;

import java.io.Serializable;
import java.math.BigDecimal;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("Entity product")
public class Product implements Serializable {

	private static final long serialVersionUID = -9077409771797633804L;
	
	@ApiModelProperty(value = "the product's id")
	private int id;

	@ApiModelProperty(value = "the product's quantity")
	private int quantity;

	@ApiModelProperty(value = "the product's cost")
	private BigDecimal cost;

	
	public Product() {}
	
	public Product(int id, int quantity, BigDecimal cost) {
		this.id = id;
		this.quantity = quantity;
		this.cost = cost;
	}
}
