package org.platform.snail.portal.service;

import java.util.Map;

import org.platfom.snail.pay.model.PaySaPi;

public interface OpenAPIService {

	public abstract boolean createOrder(Map<String, Object> order) throws Exception;

	public abstract void completeOrder(PaySaPi paySaPi) throws Exception;

	public abstract Map<String, String> getOrderStatus(String orderId) throws Exception;

}
