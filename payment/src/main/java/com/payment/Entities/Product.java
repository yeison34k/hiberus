package com.payment.Entities;

import java.math.BigDecimal;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("Entity product")
public class Product {
	
	@ApiModelProperty(value = "the product's id")
	private int quantity;
	
	@ApiModelProperty(value = "the product's cost")
	private BigDecimal cost;
}
