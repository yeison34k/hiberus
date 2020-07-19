package com.bill.service;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;

import com.bill.Entities.Bill;
import com.bill.dao.BillDao;

public class BillServiceTest {
	
	@MockBean
	private BillDao billDao;
	
	
	@Autowired
	private BillService billService;
	
	@Test
	public void get_bills() {
		List<Bill> list = new ArrayList<Bill>();
		when(billDao.findAll()).thenReturn(list); 
		assertNotNull(billService.getBills());
	}

	public void getBill(Long id) {
		
	}

	public void createBill(Bill order) {
		
	}
}
