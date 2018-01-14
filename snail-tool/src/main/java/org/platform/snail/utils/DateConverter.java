package org.platform.snail.utils;

import java.util.Date;

import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.Converter;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class DateConverter implements Converter {

	public Logger logger = LogManager.getLogger(this.getClass());
	private Object defaultValue = null;
	private boolean useDefault = true;

	public DateConverter() {
		this.useDefault = true;

	}

	public Object convert(@SuppressWarnings("rawtypes") Class type, Object value) {
		if (value == null || "".equals(value)) {
			if (useDefault) {
				return (defaultValue);
			} else {
				throw new ConversionException("No value specified");
			}
		}

		if (value instanceof Date) {
			return (value);
		}
		if (value instanceof String) {
			try {
				return SnailUtils.parseDate(value.toString(), "yyyy-MM-dd");
			} catch (Exception e) {
				logger.error("convert error ocured.", e);
				if (useDefault) {
					return (defaultValue);
				} else {
					throw new ConversionException(e);
				}
			}

		}
		return defaultValue;
	}

}
