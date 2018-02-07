package org.platform.snail.portal.service;

import java.util.Map;

import org.platfom.snail.pay.model.PaySaPi;
import org.platform.snail.beans.DataResponse;

public interface OpenAPIService {

	public abstract boolean createOrder(Map<String, Object> order) throws Exception;

	public abstract void completeOrder(PaySaPi paySaPi) throws Exception;

	public abstract Map<String, String> getOrderStatus(String orderId) throws Exception;

	public abstract DataResponse applyToBEAgent(Map<String, String> map) throws Exception;

	public abstract DataResponse getMallInfo(String userId,int way) throws Exception;
}
