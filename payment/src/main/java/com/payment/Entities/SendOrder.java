package com.payment.Entities;

import java.util.Date;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class SendOrder {
	
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
