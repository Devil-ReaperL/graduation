package com.liu.graduation.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.liu.graduation.dao.OrderDao;
import com.liu.graduation.dao.RemarkDao;
import com.liu.graduation.dao.UserDao;
import com.liu.graduation.entities.Order;
import com.liu.graduation.entities.Remark;
import com.liu.graduation.entities.UserBeen;
import com.liu.graduation.service.UserService;

@Service("userService")
public class UserServiceimpl implements  UserService{
	
	static Logger logger = LogManager.getLogger(UserServiceimpl.class.getName());

	@Resource
	private UserDao userDao;
	
	@Resource
	private OrderDao orderDao;
	
	@Resource
	private RemarkDao remarkDao;
	
	@Override
	public List<UserBeen> VerifiUser(UserBeen user) {
		// TODO Auto-generated method stub
		return userDao.findUserByinfo(user);
	}

	@Override
	public int insertRemark(Remark remark, MultipartFile[] files, String orderid) {
		remark.setRemark_src("");
		String path = findServerPath();
		String f=UUID.randomUUID().toString()+"\\";
		try {
			if( files.length>0)
			for (MultipartFile multipartFile : files) {			
				String s=saveImgfile(multipartFile, path+f);
				if(s!="")
				{
					remark.setRemark_src(f, s+";");
				}
			}
			Order order=orderDao.findOrderByid(orderid);
			remark.setAddress(order.getAddress().getProvince()+" "+order.getAddress().getCity()+" "+order.getAddress().getCounty());
			remark.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(order.getAddtime()));
			
			if (remarkDao.insertRemark(remark)>0) {
				if (orderDao.updateOrder_productRemark(orderid, "10")>0) {
					return 1;
				}
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
		return 0;
	}
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
				return fileName;
		   }
		   
		return "";
	}
	public  String findServerPath(){
		String dir=new String();
		try {
			//通过反射来获取路径
			String resoucePath=UserServiceimpl.class.getResource("/").getPath();
			//获取需要的dir
			dir=(new File(resoucePath,"../../")).getCanonicalPath();
			
		} catch (Exception e) {
		}
		
		return dir+"-Remarkimg\\";
	}

}
