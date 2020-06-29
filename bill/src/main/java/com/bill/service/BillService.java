package com.bill.service;

import java.util.List;
import java.util.Optional;

import com.bill.Entities.Bill;

public interface BillService {

	public List<Bill> getBills();

	public Optional<Bill> getBill(Long id);

	public Bill createBill(Bill order);
}
