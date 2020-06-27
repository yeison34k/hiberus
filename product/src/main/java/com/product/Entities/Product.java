package com.product.Entities;

import java.math.BigDecimal;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@Data
@Document(collection = "product")
@ApiModel("Entity product")
public class Product {
	
	@Id
	@ApiModelProperty(value = "the product's id")
    private Long id;
	
	@ApiModelProperty(value = "the product's cost", required = false)
	private BigDecimal cost;
	
	public Product() {}
	
	public Product(long id, BigDecimal cost) {
		this.id = id;
		this.cost = cost;
	}
}
