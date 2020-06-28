package com.payment.Entities;

import lombok.Data;

@Data
public class Logistic {
	
	private Long id;
	private Long order;
	private boolean enviado;
	
	public Logistic() {
		
	}
	
	public Logistic(Long id, Long order, boolean enviado) {
		this.id = id;
		this.order = order;
		this.enviado = enviado;
	}
}
