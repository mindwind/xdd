package org.craft.cowork.util;

import java.text.NumberFormat;
import java.util.Locale;

/**
 * String util class. 字符串工具类
 * 
 * @author Frank Hu
 * @version 1,0, 2008/1/17
 * @since 1.0
 */
public class StringUtil {

	private StringUtil() {
		throw new UnsupportedOperationException();
	}
	
	/**
	 * 将一个字符串的首字符小写
	 * 
	 * @param source
	 * @return
	 */
	public static String firstCharToLowerCase(String src) {
		return src.substring(0, 1).toLowerCase() + src.substring(1);
	}

	/**
	 * 字符串数组中是否包含指定的字符串。 若指定字符串是字符串数组中某一项的子串时也返回true; <br>
	 * 若指定字符串时 ""或null 空串，返回 false
	 * 
	 * @param strings
	 *            字符串数组
	 * @param string
	 *            字符串
	 * @param caseSensitive
	 *            是否大小写敏感
	 * @return 包含时返回true，否则返回false
	 * @since 1.0
	 */
	public static boolean contains(String[] strings, String string,
			boolean caseSensitive) {
		if (string == null || string.trim().length() == 0) {
			return false;
		}

		for (int i = 0; i < strings.length; i++) {
			if (caseSensitive == true) {
				if (strings[i].equals(string)
						|| strings[i].indexOf(string) != -1) {
					return true;
				}
			} else {
				if (strings[i].equalsIgnoreCase(string)
						|| strings[i].toLowerCase().indexOf(
								string.toLowerCase()) != -1) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 将字符串数组使用指定的分隔符合并成一个字符串。
	 * 
	 * @param array
	 *            字符串数组
	 * @param delim
	 *            分隔符，为null的时候使用""作为分隔符（即没有分隔符）
	 * @return 合并后的字符串
	 * @since 1.0
	 */
	public static String combineStringArray(String[] array, String delim) {
		int length = array.length - 1;
		if (delim == null) {
			delim = "";
		}
		StringBuffer result = new StringBuffer(length * 8);
		for (int i = 0; i < length; i++) {
			result.append(array[i]);
			result.append(delim);
		}
		result.append(array[length]);
		return result.toString();
	}

	/**
	 * 去除左边多余的空格。
	 * 
	 * @param value
	 *            待去左边空格的字符串
	 * @return 去掉左边空格后的字符串
	 * @since 1.0
	 */
	public static String trimLeft(String value) {
		String result = value;
		if (result == null)
			return result;
		char ch[] = result.toCharArray();
		int index = -1;
		for (int i = 0; i < ch.length; i++) {
			if (Character.isWhitespace(ch[i])) {
				index = i;
			} else {
				break;
			}
		}
		if (index != -1) {
			result = result.substring(index + 1);
		}
		return result;
	}

	/**
	 * 去除右边多余的空格。
	 * 
	 * @param value
	 *            待去右边空格的字符串
	 * @return 去掉右边空格后的字符串
	 * @since 1.0
	 */
	public static String trimRight(String value) {
		String result = value;
		if (result == null)
			return result;
		char ch[] = result.toCharArray();
		int endIndex = -1;
		for (int i = ch.length - 1; i > -1; i--) {
			if (Character.isWhitespace(ch[i])) {
				endIndex = i;
			} else {
				break;
			}
		}
		if (endIndex != -1) {
			result = result.substring(0, endIndex);
		}
		return result;
	}

	/**
	 * 判断指定字符串是否由纯数字组成字符串(含小数点)<br>
	 * 若指定字符串为<code>null</code>返回false<br>
	 * 对于指定字符串包含头尾空格, 将首先被trim()再作判断
	 * 
	 * @param source
	 * @return boolean
	 * @since 1.0
	 */
	public static boolean isDigitalString(String source) {
		if (source == null) {
			return false;
		}
		source = source.trim();

		for (int i = 0; i < source.length(); i++) {
			if (Character.isDigit(source.charAt(0)) || source.charAt(0) == '.') {
				continue;
			} else {
				return false;
			}
		}
		return true;
	}

	/**
	 * 字符串全角转半角, 传入<tt>null</tt>不进行转换直接返回空字符串
	 * 
	 * @param input
	 * @return
	 * @since 0.1
	 */
	public static String q2b(String input) {
		if (input == null) {
			return "";
		}
		char[] c = input.toCharArray();
		for (int i = 0; i < c.length; i++) {
			// 空格情况 ASCII-32
			if (c[i] == 12288) {
				c[i] = (char) 32;
				continue;
			}
			// ASCII字符 33-126 对应全角unicode码为 65281-65374
			if (c[i] > 65280 && c[i] < 65375) {
				c[i] = (char) (c[i] - 65248);
			}
		}
		return new String(c);
	}

	/**
	 * 字符串半角转全角, 传入<tt>null</tt>不进行转换直接返回空字符串
	 * 
	 * @param input
	 * @return
	 * @since 0.1
	 */
	public static String b2q(String input) {
		if (input == null) {
			return "";
		}
		char[] c = input.toCharArray();
		for (int i = 0; i < c.length; i++) {
			// 空格情况 ASCII-32
			if (c[i] == 32) {
				c[i] = (char) 12288;
				continue;
			}
			// ASCII字符 33-126 对应全角unicode码为 65281-65374
			if (c[i] < 127)
				c[i] = (char) (c[i] + 65248);
		}
		return new String(c);
	}

	/**
	 * 查找源字符串中目标字符子串出现的次数
	 * 
	 * @param src
	 *            源字符串
	 * @param target
	 *            目标字符串
	 * @return
	 * @since 0.1
	 */
	public static int count(String src, String target) {
		int count = 0;
		int index = src.indexOf(target);
		while (index != -1) {
			count++;
			index = src.indexOf(target, index + 1);
		}
		return count;
	}

	/**
	 * 将字符串中的变量使用values数组中的内容进行替换。 替换的过程是不进行嵌套的，即如果替换的内容中包含变量表达式时不会替换。
	 * 
	 * @param prefix
	 *            变量前缀字符串
	 * @param source
	 *            带参数的原字符串
	 * @param values
	 *            替换用的字符串数组
	 * @return 替换后的字符串。 如果前缀为null则使用“%”作为前缀；
	 *         如果source或者values为null或者values的长度为0则返回source；
	 *         如果values的长度大于参数的个数，多余的值将被忽略；
	 *         如果values的长度小于参数的个数，则后面的所有参数都使用最后一个值进行替换。
	 * @since 0.3 Frank Hu - 在0.2版本基础修正其中变量参数不能超过10的bug
	 */
	public static String getReplaceString(String prefix, String source,
			String[] values) {
		if (source == null || values == null || values.length < 1) {
			return source;
		}
		if (prefix == null) {
			prefix = "%";
		}

		String result = new String(source);
		for (int i = 0, count = 0; true; i++) {
			String argument = prefix + Integer.toString(i + 1);
			int index = result.indexOf(argument);
			count++;
			if (index != -1) {
				int len = new Integer(count).toString().length() + 1;
				String temp = result.substring(0, index);
				if (i < values.length) {
					temp += values[i];
				} else {
					temp += values[values.length - 1];
				}
				temp += result.substring(index + len);
				result = temp;
			} else {
				break;
			}
		}
		return result.toString();
	}

	/**
	 * 将字符串中的变量标记使用value进行替换。 替换的过程是不进行嵌套的，即如果替换的内容中包含变量表达式时不会替换。
	 * 
	 * @param prefix
	 *            变量前缀字符串
	 * @param source
	 *            带参数的原字符串
	 * @param value
	 *            替换用的字符串
	 * @return 替换后的字符串。 如果前缀为null则使用“%”作为前缀； 如果source或者value为null则返回source；
	 * @since 0.1
	 */
	public static String getReplaceString(String prefix, String source,
			String value) {
		String[] values = new String[1];
		values[0] = value;
		return getReplaceString(prefix, source, values);
	}

	/**
	 * 将字符串中的变量（以“%”为前导后接数字）使用values数组中的内容进行替换。
	 * 替换的过程是不进行嵌套的，即如果替换的内容中包含变量表达式时不会替换。
	 * 
	 * @param source
	 *            带参数的原字符串
	 * @param values
	 *            替换用的字符串数组
	 * @return 替换后的字符串
	 * @since 0.1
	 */
	public static String getReplaceString(String source, String[] values) {
		return getReplaceString("%", source, values);
	}
	
	/**
	 * 根据Locale格式化金额字符串
	 * 
	 * @param source
	 * @param locale
	 * @return The fomatted string
	 */
	public static String formatCurrency(String source, Locale locale) {
		if (source == null) {
			throw new NullPointerException("arg:source");
		}

		Double currency = Double.parseDouble(source);
		NumberFormat nf = NumberFormat.getCurrencyInstance(locale);
		nf.setMaximumFractionDigits(2);
		nf.setMinimumFractionDigits(2);
		return nf.format(currency);
	}

}
