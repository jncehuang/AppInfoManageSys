package cn.echarts.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.util.FTPUtil;

/**
 * 
 * @author yxx
 * 
 */
@Controller
public class FileController {

	/**
	 * 文件上传
	 * @param session
	 * @param request
	 * @param uploadFile
	 * @return
	 */
	@RequestMapping(value = "/addFile.html")
	public String addFile(
			HttpSession session,
			HttpServletRequest request,
			@RequestParam(value = "uploadFile", required = false) MultipartFile[] uploadFile) {
		StringBuffer sb = new StringBuffer();
		String basePath = "/message";// 设置服务器中文件保存的根目录
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		String filePath = dateFormat.format(now); // 根据当前时间设置文件保存的子目录
		FTPUtil ftp;
		System.out.println("此次上传的文件个数" + uploadFile.length);
		if (uploadFile != null && uploadFile.length > 0) {
			ftp = new FTPUtil();
			ftp.connectServer();
			// 通过FTP实现文件的上传
			try {
				if (!ftp.uploadFile(uploadFile, basePath, filePath)) {
					return "error";
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 切记记住使用完ftp后需要关闭连接，和jdbc创建数据库连接道理一样
				ftp.closeServer();
			}

			// 记录页面表单提交过来的文件名
			for (int i = 0; i < uploadFile.length; i++) {
				String fileName;
				fileName = new String(uploadFile[i].getOriginalFilename());
				if (i != 0) {
					sb.append(",");
				}
				sb.append(fileName);// 用逗号连接文件名存入数据库
			}
		}
		System.out.println("可以参考保存到数据库的信息:" + sb.toString());
		return "/file/uploadFile";
	}


	/**
	 * 文件下载
	 * @param response
	 * @param session
	 * @param request
	 * @param uploadFile
	 */
	@RequestMapping(value = "/downLoadFile.html")
	public void downLoadFile(
			HttpServletResponse response,
			HttpSession session,
			HttpServletRequest request,
			@RequestParam(value = "uploadFile", required = false) String uploadFile) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("multipart/form-data;charset=UTF-8");
		FTPUtil ftp = new FTPUtil();
		ftp.downloadFile(response, uploadFile, "");
	}
}
