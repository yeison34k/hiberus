package com.logistic.Entities;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@Document(collection = "send_order")
@ApiModel("Entity product")
public class SendOrder {

	@Id
	@Field("_id")
	@ApiModelProperty(value = "the SendOrder's id")
	private String id;

	@ApiModelProperty(value = "the SendOrder's orden id")
	private String order;

	@ApiModelProperty(value = "the SendOrder's send")
	private boolean send;

	@ApiModelProperty(value = "the SendOrder's direction")
	private String direction;

	public SendOrder() {
	}

	public SendOrder(String id, String order, boolean send, String direction) {
		this.id = id;
		this.order = order;
		this.send = send;
		this.direction = direction;
	}	
}
