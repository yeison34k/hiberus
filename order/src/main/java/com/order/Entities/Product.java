package com.order.Entities;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("Entity product")
public class Product {
	
	@ApiModelProperty(value = "the product's id")
	private int id;
	
	@ApiModelProperty(value = "the product's quantity")
	private int quantity;
	
	@ApiModelProperty(value = "the product's cost")
	private BigDecimal cost;
	
	Product() {}
	
	@JsonCreator
	public Product(@JsonProperty("id") int id, @JsonProperty("quantity") int quantity, @JsonProperty("cost") BigDecimal cost) {
		this.id = id;
		this.quantity = quantity;
		this.cost = cost;
	}
}
