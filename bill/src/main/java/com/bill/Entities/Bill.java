package com.bill.Entities;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@Data
@Document(collection = "bill")
@ApiModel("Entity bill")
public class Bill {
	
	@Id
	@Field("_id")
	@ApiModelProperty(value = "the Bill's id")
    private String id;
	
	@ApiModelProperty(value = "the Bill's numberBill")
	private String numberBill;
	
	@ApiModelProperty(value = "the Bill's clientId")
	private String clientId;
	
	@ApiModelProperty(value = "the Bill's phone")
	private String phone;
	
	@ApiModelProperty(value = "the Bill's direction")
	private String direction;
	
	@ApiModelProperty(value = "the Bill's clientIdentity")
	private String clientIdentity;
	
	@ApiModelProperty(value = "the Bill's clientName")
	private String clientName;
	
	@ApiModelProperty(value = "the Bill's quantity")
	private String quantity;
	
	@ApiModelProperty(value = "the Bill's paymentMethod")
	private String paymentMethod;
	
	@ApiModelProperty(value = "the Bill's total")
	private BigDecimal total;
	
	@ApiModelProperty(value = "the Bill's date")
	private Date date;
	
	@ApiModelProperty(value = "the Bill's products")
	private List<Product> products;
	
	public Bill(String id, String numberBill, String clientId, String phone, String direction, String clientIdentity,
			String clientName, String quantity, String paymentMethod, BigDecimal total, Date date, List<Product> products) {
		this.id = id;
		this.numberBill = numberBill;
		this.clientId = clientId;
		this.phone = phone;
		this.direction = direction;
		this.clientIdentity = clientIdentity;
		this.clientName = clientName;
		this.quantity = quantity;
		this.paymentMethod = paymentMethod;
		this.total = total;
		this.date = date;
		this.products = products;
	}
}
