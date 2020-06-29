package com.payment.service.impl;

import static com.payment.consts.AppConsts.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.payment.Entities.Order;
import com.payment.Entities.SendOrder;
import com.payment.service.PaymentService;

import io.swagger.annotations.ApiOperation;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Override
	@ApiOperation(value = "Generate bill and send order", notes = "Return Map with bill and send order")
	public Map<String, Object> payment(Order order) {
		Map res = new HashMap<String, Object>();
		Order createOrder = this.order(order);
		res.put(ORDER, createOrder);
		res.put(SEND, this.sendOrder(createOrder, true));
		// res.put(BILL, this.generateBill(createOrder));
		return res;
	}

	private Order order(Order order) {
		RestTemplate restTemplate = new RestTemplate();
		String url = CREATE_ORDER_URL;
		restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();

		headers.setContentType(MediaType.APPLICATION_JSON);
		JSONObject orderRequest = new JSONObject();

		orderRequest.put(CLIENTID, order.getClientId());
		orderRequest.put(DATE, new Date());
		orderRequest.put(DIRECTION, order.getDirection());
		orderRequest.put(PRODUCTS, order.getProducts());
		ResponseEntity<Order> response = restTemplate.postForEntity(url, orderRequest, Order.class);

		return response.getBody();
	}

	@ApiOperation(value = "Send order", notes = "Return send order")
	private SendOrder sendOrder(Order order, boolean send) {
		RestTemplate restTemplate = new RestTemplate();
		String url = CREAE_SEND_ORDER_URL;
		restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();

		headers.setContentType(MediaType.APPLICATION_JSON);
		JSONObject sendOrderRequest = new JSONObject();

		sendOrderRequest.put(DATE, new Date());
		sendOrderRequest.put(ORDER, order.getId());
		sendOrderRequest.put(SEND, send);
		sendOrderRequest.put(DIRECTION, order.getDirection());
		ResponseEntity<SendOrder> response = restTemplate.postForEntity(url, sendOrderRequest, SendOrder.class);
		return response.getBody();
	}

	@ApiOperation(value = "Generate bill", notes = "Return bill")
	private Object generateBill(Order order) {
		return "";
	}

}
