package com.liu.graduation.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.liu.graduation.service.ProductService;
@Service("productService")
public class ProductServiceimpl implements ProductService{

	static Logger logger = LogManager.getLogger(ProductServiceimpl.class.getName());
	@Override
	public boolean addproduct(MultipartFile[] uploadFile)  {
		String path = findServerPath();
		try {
			for (MultipartFile multipartFile : uploadFile) {
				saveImgfile(multipartFile, path);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	/**
	 * 保存文件
	 *
	 * @param file 要保存的文件
	 * @return 是否成功保存
	 * @throws Exception.文件保存过程中失败
	 */
	public String saveImgfile(MultipartFile file,String path) {
		   if (null != file && file.getSize() != 0) {
			   	int begin = file.getOriginalFilename().indexOf(".");
	            int last = file.getOriginalFilename().length();
	          //获得文件后缀名
	            String fileName = UUID.randomUUID().toString()+
	            				file.getOriginalFilename().substring(begin, last);
	            File targe = new File(path + fileName);
	            //判断父文件路径是否存在                                
	            if(!targe.getParentFile().exists())
					{       //创建路径
					targe.getParentFile().mkdirs();
					if(!targe.exists())
					{
						try {
							targe.createNewFile();
						} catch (IOException e) {
							System.out.println("创建文件失败"+e.getMessage());
							e.printStackTrace();
						}
					}
					}
					//转换
					try {
						file.transferTo(targe);				
					} catch (Exception e) {
						// TODO Auto-generated catch block
						System.out.println("存文件异常"+e.getMessage());
						e.printStackTrace();
					}
					logger.info("上传文件到\t"+ targe.getAbsolutePath());

		   }
		   
		return "";
	}
	
	/**
	 * 查找路径
	 *
	 * @return 要保存文件的路径
	 * @throws Exception.查找过程中失败
	 */
	public  String findServerPath(){
		String dir=new String();
		try {
			//通过反射来获取路径
			String resoucePath=ProductServiceimpl.class.getResource("/").getPath();
			//获取需要的dir
			dir=(new File(resoucePath,"../../")).getCanonicalPath();
			
		} catch (Exception e) {
		}
		
		return dir+"-img\\"+UUID.randomUUID().toString()+"\\";
	}

}
