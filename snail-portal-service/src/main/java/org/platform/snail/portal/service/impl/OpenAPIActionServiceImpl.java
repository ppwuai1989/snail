package org.platform.snail.portal.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.platfom.snail.pay.model.PaySaPi;
import org.platform.snail.portal.dao.MemberDao;
import org.platform.snail.portal.dao.OpenAPIDao;
import org.platform.snail.portal.model.Member;
import org.platform.snail.portal.model.TopUpRecords;
import org.platform.snail.portal.service.OpenAPIService;
import org.platform.snail.portal.vo.MemberVo;
import org.platform.snail.portal.vo.TopUpRecordsVo;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("openAPIService")
public class OpenAPIActionServiceImpl implements OpenAPIService {

	@Autowired
	private OpenAPIDao openAPIDao;
	@Autowired
	private MemberDao memberDao;

	@Override
	public boolean createOrder(Map<String, Object> order) throws Exception {
		TopUpRecords records = new TopUpRecords();
		if (SnailUtils.isBlank(order)) {
			return false;
		} else {// orderuid=10000026&orderuname=paopao&goodsname=1&amount=60000&price=6.00&istype=2
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
			int insert = this.openAPIDao.createOrder(records);
			if (insert > 0) {
				return true;
			} else {
				return false;
			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.platform.snail.portal.service.OpenAPIService#completeOrder(org.
	 * platfom.snail.pay.model.PaySaPi)
	 */
	@Override
	public void completeOrder(PaySaPi paySaPi) throws Exception {
		// 1.根据订单号、会员编号查询充值信息
		// 2.根据会员编号查询会员信息 MemberDao.selectMemberVoByPrimaryKey
		// 3. 更新用户账户信息 MemberDao.updateUsersByPrimaryKey
		// 4.更新支付订单信息
		if (paySaPi == null) {
			throw new Exception("支付信息：paySaPi为空！");
		}
		TopUpRecordsVo topUpInfo = this.openAPIDao.findTopUpRecordsByOrderInfo(paySaPi.getOrderid());
		MemberVo memberInfo = this.memberDao.selectMemberVoByPrimaryKey(paySaPi.getOrderuid());
		if (topUpInfo == null) {
			throw new Exception("充值信息：topUpInfo为空！");
		}
		if (memberInfo == null) {
			throw new Exception("会员信息：memberInfo为空！");
		}
		Member updateInfo = new Member();
		updateInfo.setUserId(memberInfo.getUserId());
		updateInfo.setCoins(calculateTopUp(memberInfo.getCoins(), topUpInfo.getCoins()));
		updateInfo.setGems(calculateTopUp(memberInfo.getGems(), topUpInfo.getGems()));
		updateInfo.setPkCard(calculateTopUp(memberInfo.getPkCard(), topUpInfo.getPkCard()));
		int updateMember = this.memberDao.updateUsersByPrimaryKey(updateInfo);
		if (updateMember < 1) {
			throw new Exception("会员账户充值异常！");
		}
		topUpInfo.setCost(paySaPi.getPrice());
		topUpInfo.setPaysApiId(paySaPi.getPaysapi_id());
		topUpInfo.setRealPrice(paySaPi.getRealprice());
		topUpInfo.setPayStatus("1");
		int updateRecords = this.openAPIDao.updateTopUpRecordsByOrderInfo(topUpInfo);
		if (updateRecords < 1) {
			throw new Exception("更新充值记录异常！");
		}

	}

	private String calculateTopUp(String member, String topUp) {
		String rst = "";
		int m = Integer.valueOf(member);
		int t = Integer.valueOf(topUp);
		rst = String.valueOf(m + t);
		return rst;
	}

	@Override
	public Map<String, String> getOrderStatus(String orderId) throws Exception {
		Map<String, String> rst = new HashMap<String, String>();
		TopUpRecordsVo records = this.openAPIDao.findTopUpRecordsByOrderInfo(orderId);
		if (records != null) {
			rst.put("orderId", records.getOrderId());
			rst.put("payStatus", records.getPayStatus());
		} else {
			rst.put("orderId", orderId);
			rst.put("payStatus", "0");
		}
		return rst;
	}

}
