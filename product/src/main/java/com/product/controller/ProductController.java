package com.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.product.Entities.Product;
import com.product.service.ProductService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.log4j.Logger;


@RestController()
@Api(value = "Products microservice", description = "This API has method get products")
public class ProductController {
	
	final static Logger logger = Logger.getLogger(ProductController.class);
	
	@Autowired
    private  ProductService productService;
	
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	@ApiOperation(value = "Find all Products", notes = "Return all Products" )
	public List<Product> getProducts() {
		return productService.getProducts();
    }
	
	
	
	
}
