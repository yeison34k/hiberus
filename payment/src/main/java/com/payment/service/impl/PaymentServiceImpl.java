package com.payment.service.impl;

import static com.payment.consts.AppConsts.CLIENTID;
import static com.payment.consts.AppConsts.CLIENT_IDENTITY;
import static com.payment.consts.AppConsts.CLIENT_NAME;
import static com.payment.consts.AppConsts.CREAE_BILL_ORDER_URL;
import static com.payment.consts.AppConsts.CREAE_SEND_ORDER_URL;
import static com.payment.consts.AppConsts.CREATE_ORDER_URL;
import static com.payment.consts.AppConsts.DATE;
import static com.payment.consts.AppConsts.DIRECTION;
import static com.payment.consts.AppConsts.NUMEBER_BILL;
import static com.payment.consts.AppConsts.ORDER;
import static com.payment.consts.AppConsts.PAYMENT_METHOD;
import static com.payment.consts.AppConsts.PHONE;
import static com.payment.consts.AppConsts.PRODUCTS;
import static com.payment.consts.AppConsts.QUANTITY;
import static com.payment.consts.AppConsts.SEND;
import static com.payment.consts.AppConsts.TOTAL;
import static com.payment.consts.AppConsts.BILL;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.payment.Entities.Bill;
import com.payment.Entities.Order;
import com.payment.Entities.OrderBillRequest;
import com.payment.Entities.SendOrder;
import com.payment.service.PaymentService;

import io.swagger.annotations.ApiOperation;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private RestTemplate restTemplate; 
	
	private String url = CREATE_ORDER_URL;
	private String url_send = CREAE_SEND_ORDER_URL;
	private String url_bill = CREAE_BILL_ORDER_URL;

	@Override
	@ApiOperation(value = "Generate bill and send order", notes = "Return Map with bill and send order")
	public Map<String, Object> payment(OrderBillRequest orderBill) {
		Map<String, Object> res = new HashMap<String, Object>();
		Order createOrder = this.order(orderBill.getOrder());
		res.put(ORDER, createOrder);
		res.put(SEND, this.sendOrder(createOrder, true));
		res.put(BILL, this.generateBill(orderBill.getBill(), createOrder));
		return res;
	}

	@ApiOperation(value = "Call api order", notes = "Return order")
	private Order order(Order order) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		Map<String, Object> orderRequest = new HashMap<String, Object>();
		
		orderRequest.put(CLIENTID, order.getClientId());
		orderRequest.put(DATE, new Date());
		orderRequest.put(DIRECTION, order.getDirection());
		orderRequest.put(PRODUCTS, order.getProducts());
		HttpEntity<Map<String, Object>> httpEntity = new HttpEntity<Map<String, Object>>(orderRequest, headers);
		
		ResponseEntity<Order> response = restTemplate.postForEntity(url, httpEntity, Order.class);
		return  response.getBody();
	}

	@ApiOperation(value = "Call Api Send order", notes = "Return send order")
	private SendOrder sendOrder(Order order, boolean send) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		Map<String, Object> sendOrderRequest = new HashMap<String, Object>();
		sendOrderRequest.put(DATE, new Date());
		sendOrderRequest.put(ORDER, order.getId());
		sendOrderRequest.put(SEND, send);
		sendOrderRequest.put(DIRECTION, order.getDirection());
		ResponseEntity<SendOrder> response = restTemplate.postForEntity(url_send, sendOrderRequest, SendOrder.class);
		return response.getBody();
	}

	@ApiOperation(value = "Call api Generate bill", notes = "Return bill")
	private Object generateBill(Bill bill, Order order) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		Map<String, Object> billRequest = new HashMap<String, Object>();
		
		String numberBill = order.getId() + order.getClientId() + bill.getClientIdentity();

		billRequest.put(DATE, new Date());
		billRequest.put(DIRECTION, order.getDirection());
		billRequest.put(NUMEBER_BILL, numberBill);
		billRequest.put(CLIENTID, order.getClientId());
		billRequest.put(PHONE, bill.getPhone());
		billRequest.put(CLIENT_IDENTITY, bill.getClientIdentity());
		billRequest.put(CLIENT_NAME, bill.getClientName());
		billRequest.put(PAYMENT_METHOD, bill.getPaymentMethod());
		billRequest.put(DATE, new Date());
		billRequest.put(PRODUCTS, order.getProducts());
		billRequest.put(QUANTITY, order.getProducts().stream().map(x -> x.getQuantity()).reduce(0, Integer::sum));
		billRequest.put(TOTAL, order.getProducts().stream().map(x -> x.getCost()).reduce(BigDecimal.ZERO, BigDecimal::add));

		HttpEntity<Map<String, Object>> httpEntity = new HttpEntity<Map<String, Object>>(billRequest, headers);
		
		ResponseEntity<Bill> response = restTemplate.postForEntity(url_bill, httpEntity, Bill.class);
		
		return response.getBody();
	}
}
