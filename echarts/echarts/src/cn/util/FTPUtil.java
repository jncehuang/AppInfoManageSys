package cn.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.SocketException;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * @author yxx
 *
 */
public class FTPUtil {
      
	private static FTPClient ftpClient;
	private static String ip = "localhost"; // 服务器IP地址
	private static String userName = "ftp"; // 用户名
	private static String userPwd = "ftp"; // 密码
	private static int port = 21; // 端口号
	private static String path = ""; // 读取文件的存放目录,因为目前存在的是FTP的根目录所以为空
	
	/**
	 * 通过构造方法初始化 FTP连接
	 *
	 */
	public FTPUtil() {
		//this.connectServer();
	}

	/**
	 * @throws SocketException
	 * @throws IOException
	 * function:连接到服务器
	 */
	public FTPClient connectServer() {
		ftpClient = new FTPClient();
		try {
			System.out.println("建立FTP连接。。。。");
			// 连接
			ftpClient.connect(ip, port);
			// 登录
			ftpClient.login(userName, userPwd);
			if (path != null && path.length() > 0) {
				// 跳转到指定目录
				ftpClient.changeWorkingDirectory(path);
			}
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ftpClient;
	}
    
	/**
	 * 文件上传的业务处理，判断上传文件的路径是否存在
	 * @param uploadFile
	 * @param basePath
	 * @param filePath
	 * @return
	 */
    public boolean uploadFile(MultipartFile[] uploadFile, String basePath, String filePath){  
        try {  
            //切换到上传目录  ,basepath需已存在  
            if (!ftpClient.changeWorkingDirectory(basePath+filePath)) {    
                //如果目录不存在创建目录    
                String[] dirs = filePath.split("/");    
                String tempPath = basePath;    
                for (String dir : dirs) {    
                    if (null == dir || "".equals(dir)) continue;    
                    tempPath += "/" + dir;    
                    if (!ftpClient.changeWorkingDirectory(tempPath)) {    
                        if (!ftpClient.makeDirectory(tempPath)) {    
                            return false;    
                        } else {    
                        	ftpClient.changeWorkingDirectory(tempPath);    
                        }    
                    }    
                }    
            }     
            //循环保存文件
            if(uploadFile != null && uploadFile.length > 0){  
                for(int i=0;i<uploadFile.length;i++){  
                    MultipartFile file = uploadFile[i];  
                    saveFile(file,ftpClient);  
                }  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }   
        return true;  
    }  
    
    /**
     * 文件保存
     * @param file
     * @param client
     * @return
     */
    private boolean saveFile(MultipartFile file,FTPClient client){  
        boolean success = false;  
        InputStream  inStream = null;  
        try {  
            String fileName = new String(file.getOriginalFilename());  
            System.out.println("上传的文件名：>>>>>>>>>>>> " + fileName);
            inStream = file.getInputStream();
            client.setFileType(FTP.BINARY_FILE_TYPE);
            success = client.storeFile(fileName, inStream);  
            if (success == true) {  
                return success;  
            }  
        }  catch (Exception e) {  
        }finally {
            if (inStream != null) {  
                try {  
                    inStream.close();  
                } catch (IOException e) {  
                }  
            }  
        }  
        return success;  
    }  
    
    
    /**
     * 文件下载
     * @param response
     * @param fileName
     * @param path
     * @return
     */
    public String downloadFile(HttpServletResponse response, String fileName, String path){  
		FTPUtil ftp = new FTPUtil();
    	FTPClient client = ftp.connectServer();
    	OutputStream os = null;
    	try {
			client.changeWorkingDirectory(path);
			response.setHeader("Content-Disposition", "attachment;fileName="
					+ new String(fileName.getBytes("gb2312"), "ISO8859-1"));
			os = response.getOutputStream();
			client.retrieveFile(fileName, os);
			os.flush();
			os.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
    }
    
	/**
	 * @param fileName
	 * 删除文件
	 */
	public void deleteFile(String fileName) {
		try {
			ftpClient.deleteFile(fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @throws IOException
	 * function:关闭连接
	 */
	public void closeServer() {
		System.out.println("关闭FTP连接。。。。。。。。");
		if (ftpClient.isConnected()) {
			try {
				ftpClient.logout();
				ftpClient.disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}  
