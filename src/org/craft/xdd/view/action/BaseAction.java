package org.craft.xdd.view.action;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.craft.xdd.service.XDDServiceException;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Provide common function support for action, as follows:
 * <li> logger
 * <li> common validator
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public abstract class BaseAction extends ActionSupport {

	// ------------------------------------------------------------------ common

	public static final String STATIC_INPUT = "static_input";

	protected final Logger log = Logger.getLogger(getClass());

	protected Map session;

	/** The action return result for dynamic result */
	protected String result;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	protected HttpServletRequest getRequest() {
		return (HttpServletRequest) ActionContext.getContext().get(
				ServletActionContext.HTTP_REQUEST);
	}

	protected HttpServletResponse getResponse() {
		return (HttpServletResponse) ActionContext.getContext().get(
				ServletActionContext.HTTP_RESPONSE);
	}

	// ----------------------------------------------------------- text provider

	/**
	 * A convenient method to get the message from a pip service exception and
	 * its subclass instance.
	 */
	protected String getMessage(XDDServiceException e) {
		return getText(e.getErrorKey());
	}

	// --------------------------------------------------------------- converter

	/**
	 * convert the source{yyyyMMddHHmmss||yyyyMMdd} to target{yyyy-MM-dd}. If
	 * the source inclued the format flag char "-" then return source.
	 * 
	 * @param source
	 * @return The formatted string
	 */
	protected String convertDate_db2page(String source) {
		if (source == null) {
			throw new NullPointerException("arg:source");
		}
		if (source.length() < 8) {
			throw new IllegalArgumentException("arg:source");
		}
		if (source.length() == 8) {
			String target = source.substring(0, 4) + "-"
					+ source.substring(4, 6) + "-" + source.substring(6, 8);
			return target;
		} else if (source.length() == 14) {
			String target = source.substring(0, 4) + "-"
					+ source.substring(4, 6) + "-" + source.substring(6, 8)
					+ " " + source.substring(8, 10) + ":"
					+ source.substring(10, 12) + ":" + source.substring(12, 14);
			return target;
		} else {
			return source;
		}
	}

	/**
	 * convert the source{yyyy-MM-dd} to target{yyyyMMdd}.
	 * 
	 * @param source
	 * @return The formatted string
	 */
	protected String convertDate_page2db(String source) {
		if (source == null) {
			throw new NullPointerException("arg:source");
		}
		if (source.length() < 10) {
			throw new IllegalArgumentException("arg:source");
		}

		String target = source.replaceAll("-", "");
		return target;
	}

	// --------------------------------------------------------------- formatter

	/**
	 * Format the date to the dedicated format string.
	 * 
	 * @param date
	 * @param format
	 * @return The formatted string
	 */
	protected String formatDate(Date date, String format) {
		DateFormat df = new SimpleDateFormat(format);
		return df.format(date);
	}

	/**
	 * Format the currency according to the locale.
	 * 
	 * @param source
	 * @param locale
	 * @return The fomatted string
	 */
	protected String formatCurrency(Double source, Locale locale) {
		if (source == null) {
			throw new NullPointerException("arg:source");
		}

		NumberFormat nf = NumberFormat.getCurrencyInstance(locale);
		nf.setMaximumFractionDigits(2);
		nf.setMinimumFractionDigits(2);
		return nf.format(source);
	}

	/**
	 * Format the currency according to the locale.
	 * 
	 * @param source
	 * @param locale
	 * @return The fomatted string
	 */
	protected String formatCurrency(String source, Locale locale) {
		return formatCurrency(Double.parseDouble(source), locale);
	}

	// -------------------------------------------------------- common validator
	// A group of method with the val prefix

	/**
	 * Validate the field is null or not.
	 * 
	 * @param
	 * @return true if the field is null or field.trim().length==0, otherwise
	 *         false.
	 */
	protected boolean valNull(String field) {
		if (field == null || field.trim().length() == 0) {
			return true;
		}
		return false;
	}

	/**
	 * Validate the field is undefined or not.
	 * 
	 * @param field
	 * @return true if the field equals undefined
	 */
	protected boolean valUndefined(String field) {
		if (field.trim().equals("undefined")) {
			return true;
		}
		return false;
	}

	/**
	 * Validate the field is not null.
	 * 
	 * @param field
	 * @return true if the field is not null and lenght>0, otherwise false.
	 */
	protected boolean valNotNull(String field) {
		return !valNull(field);
	}

	/**
	 * Validate the field's length range.
	 * 
	 * @param s
	 * @param e
	 * @param field
	 * @return true if the field length btween s and e, otherwise false.
	 */
	protected boolean valRange(int s, int e, String field) {
		if (s > e) {
			throw new IllegalArgumentException(
					"arg[s] should be less or equal arg[e].");
		}
		assert field != null;

		field = field.trim();
		byte[] b = field.getBytes();
		log.debug("<action>: field[" + field + "] len = " + b.length);
		if (b.length >= s && b.length <= e) {
			return true;
		}
		return false;
	}

	/**
	 * Validate the field whether is equal with target or not.
	 * 
	 * @param field
	 * @param target
	 * @return true if the field is equal with target, otherwise false.
	 */
	protected boolean valEqual(String field, String target) {
		if (field == null) {
			field = "";
		}
		if (target == null) {
			target = "";
		}

		return field.trim().equals(target.trim());
	}

	/**
	 * Validate the field whether is not equal with target or not.
	 * 
	 * @param field
	 * @param target
	 * @return true if the field is not equal with target, otherwise false.
	 */
	protected boolean valNotEqual(String field, String target) {
		return !valEqual(field, target);
	}

	/**
	 * Validate the field whether is accord with give format.
	 * 
	 * @param format
	 * @param field
	 * @return true if the field is not equal with target, otherwise false.
	 */
	protected boolean valDateFormat(String field, String format) {
		DateFormat df = new SimpleDateFormat(format);
		try {
			df.parse(field);
		} catch (ParseException e) {
			return false;
		}
		return true;
	}

}
