package com.order.Entities;

import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@Document(collection = "order")
@ApiModel("Entity order")
public class Order {
	@Id
	@Field("_id")
	@ApiModelProperty(value = "the order's id")
	private String id;
	
	@ApiModelProperty(value = "the order's clientId")
	private String clientId;
	
	@ApiModelProperty(value = "the order's date")
	private Date date;
	
	@ApiModelProperty(value = "the order's direction")
	private String direction;
	
	@ApiModelProperty(value = "the order's products")
	private List<Product> products;
	
	public Order() {}

	public Order(String id, String clientId, Date date, String direction, List<Product> products) {
		this.id = id;
		this.clientId = clientId;
		this.date = date;
		this.direction = direction;
		this.products = products;
	}
}
