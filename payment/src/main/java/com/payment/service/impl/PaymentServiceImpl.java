package com.payment.service.impl;

import static com.payment.consts.AppConsts.CLIENTID;
import static com.payment.consts.AppConsts.CREATE_ORDER_URL;
import static com.payment.consts.AppConsts.DATE;
import static com.payment.consts.AppConsts.DIRECTION;
import static com.payment.consts.AppConsts.PRODUCTS;

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
import com.payment.service.PaymentService;

import io.swagger.annotations.ApiOperation;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Override
	@ApiOperation(value = "Generate bill and send order", notes = "Return Map with bill and send order" )
	public Map payment(Order order) {
		Map res = new HashMap<String, Object>();
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

		
		res.put("rs", response.getBody());
		res.put("send", this.sendOrder(response.getBody().getId()));
		res.put("bill", this.generateBill(response.getBody()));

		return res;
	}

	@ApiOperation(value = "Send order", notes = "Return send order" )
	private boolean sendOrder(String orderId) {
		return true;
	}

	@ApiOperation(value = "Generate bill", notes = "Return bill" )
	private Object generateBill(Order order) {
		return "";
	}
}
