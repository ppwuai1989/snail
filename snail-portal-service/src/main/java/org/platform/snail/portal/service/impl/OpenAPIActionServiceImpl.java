package org.platform.snail.portal.service.impl;

import java.util.Map;

import org.platform.snail.portal.dao.OpenAPIDao;
import org.platform.snail.portal.model.TopUpRecords;
import org.platform.snail.portal.service.OpenAPIService;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("openAPIService")
public class OpenAPIActionServiceImpl implements OpenAPIService {

	@Autowired
	private OpenAPIDao openAPIDao;

	@Override
	public boolean createOrder(Map<String, Object> order) {
		TopUpRecords records = new TopUpRecords();
		if (SnailUtils.isBlank(order)) {
			return false;
		} else {
			String userId = String.valueOf(order.get("orderuid"));
			String userName = String.valueOf(order.get("orderuname"));
			String goodsName = String.valueOf(order.get("goodsname"));
			String amount = String.valueOf(order.get("amount"));
			String price = String.valueOf(order.get("price"));
			String orderId = String.valueOf(order.get("orderid"));
			switch (goodsName) {
			case CommonKeys.goods_coins:
				records.setCoins(amount);
				records.setGems("0");
				records.setPkCard("0");
				break;
			case CommonKeys.goods_pkCard:
				records.setCoins("0");
				records.setGems("0");
				records.setPkCard(amount);
				break;
			default:
				return false;
			}
			records.setWay(CommonKeys.wayOfInGame);
			records.setCost(price);
			records.setUserId(userId);
			records.setUserName(userName);
			records.setOrderId(orderId);
			records.setPayStatus("0");
			this.openAPIDao.createOrder(records);
			return true;
		}
	}

}
