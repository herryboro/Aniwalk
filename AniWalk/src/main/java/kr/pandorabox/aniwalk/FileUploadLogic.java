package kr.pandorabox.aniwalk;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadLogic {
	FileOutputStream fos;
	public String upload(MultipartFile file,String path,String fileName){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		Date nowdate = new Date();
		String dateString = formatter.format(nowdate);
		fileName = dateString + fileName;
		try {
			byte[] data = file.getBytes();
			fos = 
			new FileOutputStream(path+File.separator+fileName);
			fos.write(data);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				if(fos!=null)fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return fileName;
	}
}









