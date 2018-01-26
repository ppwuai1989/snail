package org.platform.snail.portal.service;

import java.util.Map;

import org.springframework.stereotype.Service;


public interface OpenAPIService {

	public abstract boolean createOrder(Map<String, Object> order);

}
