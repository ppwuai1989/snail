package org.platfom.snail.pay.model;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.utils.ImgUtils;
import org.platform.snail.utils.PayUtils;
import org.platform.snail.utils.SnailBeanUtils;

import net.sf.json.JSONObject;

public class QRCodeMsg implements Serializable {

	private static Logger logger = LogManager.getLogger();

	private String msg;

	private String code;

	private String url;
	
	private String orderid;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	private String data;

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	private data dataMsg;

	/**
	 * 通过传入的json字符串 赋值给该类
	 * 
	 * @param data
	 * @return
	 */
	public data getDataMsg(String data) {
		data d = new data();
		try {
			JSONObject json = JSONObject.fromObject(data);
			SnailBeanUtils.copyProperties(d, json);
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return d;
	}

	public data getDataMsg() {
		return dataMsg;
	}

	public void setDataMsg(data dataMsg) {
		this.dataMsg = dataMsg;
	}

	public class data {

		private String qrcode;

		private String istype;

		private String realprice;

		public String getQrcode() {
			return qrcode;
		}

		public void setQrcode(String qrcode) {
			this.qrcode = ImgUtils.getBase64ImgString(PayUtils.QRCODE_URL + qrcode).replaceAll("\n", "").replaceAll("\r", "");
		}

		public String getIstype() {
			return istype;
		}

		public void setIstype(String istype) {
			this.istype = istype;
		}

		public String getRealprice() {
			return realprice;
		}

		public void setRealprice(String realprice) {
			this.realprice = realprice;
		}

		@Override
		public String toString() {
			return "data [qrcode=" + qrcode + ", istype=" + istype + ", realprice=" + realprice + "]";
		}

	}

	@Override
	public String toString() {
		return "QRCodeMsg [msg=" + msg + ", code=" + code + ", url=" + url + ", data=" + data + ", dataMsg="
				+ dataMsg.toString() + "]";
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

}
