package com.bill.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bill.Entities.Bill;
import com.bill.dao.BillDao;
import com.bill.service.BillService;

@Service
public class BillServiceImpl implements BillService {

	@Autowired
	private BillDao billDao;

	@Override
	public List<Bill> getBills() {
		return billDao.findAll();
	}

	@Override
	public Optional<Bill> getBill(Long id) {
		return billDao.findById(id);
	}

	@Override
	public Bill createBill(Bill bill) {
		return billDao.insert(bill);
	}
}
