package com.bill.Enties;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.bill.Entities.Bill;
import com.bill.Entities.Product;

public class BillTest {
	
	private String id = "identity";
	private String numberBill = "number bill";
	private String clientId = "client id";
	private String phone = "phone";
	private String direction = "direction";
	private String clientIdentity = "client identity";
	private String clientName = "client name";
	private String quantity = "quantity";
	private String paymentMethod = "pay metho";	
	private BigDecimal total = new BigDecimal(100.0) ;
	private Date date = new Date();
	private List<Product> products = new ArrayList<Product>();
	
	
	@Test
	public void valid_constructor() {
		Bill bill = new Bill(id, numberBill, clientId, phone, direction, clientIdentity,
				clientName, quantity, paymentMethod, total,  date, products);
		
		assertNotNull(bill);
	}
}
