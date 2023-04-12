package com.lms.librarymanagementsystem.FileHandler;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileHandler {
    public static boolean saveFile(MultipartFile file,String path) {
		try {
			InputStream is=file.getInputStream();
			byte[] fileArray=new byte[is.available()];
			is.read(fileArray);
			
			FileOutputStream fos=new FileOutputStream(path+"\\"+file.getOriginalFilename());
			fos.write(fileArray);
			fos.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}
