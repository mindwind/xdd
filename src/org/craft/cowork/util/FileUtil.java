package org.craft.cowork.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * 文件操作工具类
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-1
 */
public class FileUtil {

	private static final int BUFFER_SIZE = 16 * 1024;

	public FileUtil() {
		throw new UnsupportedOperationException();
	}

	public static void copy(File src, File dst) throws Exception {
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
			out = new BufferedOutputStream(new FileOutputStream(dst),
					BUFFER_SIZE);
			byte[] buffer = new byte[BUFFER_SIZE];
			while (in.read(buffer) > 0) {
				out.write(buffer);
			}
		} finally {
			if (null != in) {
				in.close();
			}
			if (null != out) {
				out.close();
			}
		}
	}

	public static String suffix(File file) {
		String name = file.getName();
		int pos = name.lastIndexOf(".");
		return name.substring(pos);
	}
	
	public static String suffix(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

}
