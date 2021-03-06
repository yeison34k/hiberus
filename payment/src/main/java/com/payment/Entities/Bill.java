package com.payment.Entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class Bill implements Serializable{

	private static final long serialVersionUID = 4441093677701364591L;

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

	public Bill() {
	}

	public Bill(String id, String numberBill, String clientId, String phone, String direction, String clientIdentity,
			String clientName, String quantity, String paymentMethod, BigDecimal total, Date date,
			List<Product> products) {
		super();
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
