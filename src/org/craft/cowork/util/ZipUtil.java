package org.craft.cowork.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * ZIP util class. ZIP压缩/解压工具类
 * 
 * @author Hu Feng
 * @version 1.0, 2008-8-4
 */
public class ZipUtil {

	private ZipUtil() {
		throw new UnsupportedOperationException();
	}

	/**
	 * zip to byte[]
	 * 
	 * @param in
	 * @return
	 * @throws IOException
	 */
	public static byte[] zip(String in) throws IOException {
		byte[] result = null;
		ZipOutputStream zipos = null;
		ByteArrayOutputStream baos = null;
		try {
			baos = new ByteArrayOutputStream();
			zipos = new ZipOutputStream(baos);
			zipos.setMethod(ZipOutputStream.DEFLATED);
			zipos.putNextEntry(new ZipEntry("zip"));
			zipos.write(in.getBytes());
			zipos.flush();
			zipos.close();
			result = baos.toByteArray();
		} finally {
			baos.close();
		}
		return result;
	}

	/**
	 * zip to file
	 * 
	 * @param in
	 * @param file
	 * @param name
	 *            entry name
	 * @return
	 * @throws IOException
	 */
	public static File zip(String in, File outFile, String name)
			throws IOException {
		ZipOutputStream zipos = null;
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(outFile);
			zipos = new ZipOutputStream(fos);
			zipos.setMethod(ZipOutputStream.DEFLATED);
			zipos.putNextEntry(new ZipEntry(name));
			zipos.write(in.getBytes());
		} finally {
			zipos.close();
			fos.close();
		}
		return outFile;
	}

	/**
	 * unzip for byte[]
	 * 
	 * @param in
	 * @return
	 */
	public static String unzip(byte[] in) throws IOException {
		String result = null;
		ZipInputStream zipis = null;
		try {
			zipis = new ZipInputStream(new ByteArrayInputStream(in));
			zipis.getNextEntry();
			result = read(zipis);
		} finally {
			zipis.close();
		}
		return result;
	}

	/**
	 * unzip for file
	 * 
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public static String unzip(File file) throws IOException {
		String result = null;
		ZipInputStream zipis = null;
		try {
			zipis = new ZipInputStream(new FileInputStream(file));
			zipis.getNextEntry();
			result = read(zipis);
		} finally {
			zipis.close();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	private static String read(ZipInputStream zipis) throws IOException {
		List l = new ArrayList();
		byte b = 0;
		while ((b = (byte) zipis.read()) != -1) {
			l.add(new Byte(b));
		}
		byte[] bytes = new byte[l.size()];
		for (int i = 0; i < l.size(); i++) {
			Byte e = (Byte) l.get(i);
			bytes[i] = e.byteValue();
		}
		return new String(bytes);
	}
}
