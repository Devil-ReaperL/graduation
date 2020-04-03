package com.liu.graduation.service.impl;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.liu.graduation.dao.AttrDao;
import com.liu.graduation.dao.ProductDao;
import com.liu.graduation.entities.AttrBeen;
import com.liu.graduation.entities.Product;
import com.liu.graduation.entities.support.Pagination;
import com.liu.graduation.entities.support.PaginationUtils;
import com.liu.graduation.service.ProductService;
@Service("productService")
public class ProductServiceimpl implements ProductService{

	static Logger logger = LogManager.getLogger(ProductServiceimpl.class.getName());
	
	@Resource
	private AttrDao attrDao;
	
	@Resource
	private ProductDao productDao;
	
	@Override
	public boolean addproduct(Product product)  {
		
		Product p= productDao.selectProductById(product.getId());
		if(p!=null)
		{
			logger.debug("添加商品的商品编号已经存在");
			return false;
		}
			
		product.setSrc("");
		String path = findServerPath();
		String f=UUID.randomUUID().toString()+"\\";
		try {
			if( product.getFiles().length>0)
			for (MultipartFile multipartFile : product.getFiles()) {			
				String s=saveImgfile(multipartFile, path+f);
				if(s!="")
				{
					product.setSrc(f, s+";");
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		if(productDao.insertProduct(product)==1)
		return true;
		else
		return false;
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
				return fileName;
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
		
		return dir+"-img\\";
	}
	@Override
	public List<AttrBeen> findAttrList() {
		
		return attrDao.selectList();
	}
	
	
	@Override
	public String findProductList(Product product,Model model, int currpage) {
		
		int recordCount = productDao.countProductByInfo(product);
        int disp = Integer.parseInt(getPageConf().getProperty("disp")) ;
        int offset = (currpage - 1) * disp;
        
		List<Product> products=productDao.queryProductByPage(new RowBounds(offset, disp));
		List<Pagination> pages = PaginationUtils.pagination(recordCount, currpage, disp);
		for (Product p : products) {
			p.setSrcs(p.getSrc());
		}
		model.addAttribute("products", products);
		model.addAttribute("pages", pages);
		model.addAttribute("pageCnt", recordCount%disp<1?recordCount/disp:recordCount/disp+1);	
		return "";
	}
	public static void main(String[] args) {
		System.out.println(new ProductServiceimpl().getPageConf().getProperty("disp"));
	}
	public  Properties getPageConf()   {
		Properties props = new Properties();
		try {
			InputStream in = (InputStream) this.getClass().getResourceAsStream("/page.properties");			
			InputStreamReader inputStreamReader = new InputStreamReader(in, "UTF-8");
			props.load(inputStreamReader);
		} catch (Exception e) {
			logger.debug("page.properties 获取失败"  +e.getMessage());
		}
	
		return props;
		
	}
	@Override
	public int deleteProduct(Product product) {
		logger.info("删除商品"+product.getId()+"-----"+product.getEndtime());
		return productDao.deleteProduct( product);
	}
	@Override
	public Product findProductByid(String id) {
		// TODO Auto-generated method stub
		return productDao.selectProductById(id);
	}
	@Override
	public int deleteImg(String id, String src) {
		// TODO Auto-generated method stub
		return productDao.deleteImg(id, src);
	}
	@Override
	public int updateProduct(Product product) {
		if (product.getFiles()!=null) {
			product.setSrc("");
			String path = findServerPath();
			String f=UUID.randomUUID().toString()+"\\";
			try {
				if( product.getFiles().length>0)
				for (MultipartFile multipartFile : product.getFiles()) {			
					String s=saveImgfile(multipartFile, path+f);
					if(s!="")
					{
						product.setSrc(f, s+";");
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			}
			
		}
		return productDao.updateProduct(product);
	}
	@Override
	public Map<String, Object> findProductList(String find, int currpage) {
		Map<String, Object>  map=new HashMap<String, Object>();
		int recordCount = productDao.countProductBykey(find);
        int disp = Integer.parseInt(getPageConf().getProperty("disp")) ;
        int offset = (currpage - 1) * disp;
        
		List<Product> products=productDao.queryProductBykey(find,new RowBounds(offset, disp));
		List<Pagination> pages = PaginationUtils.pagination(recordCount, currpage, disp);
		for (Product p : products) {
			p.setSrcs(p.getSrc());
		}
		
		map.put("curPage", currpage);
		map.put("products", products);
		map.put("pages", pages);
		map.put("key", find);
		map.put("pageCnt", recordCount%disp<1?recordCount/disp:recordCount/disp+1);
		return map;
	}
	@Override
	public void home(Model model) {
		Map<String, List<Product>> map=new HashMap<String, List<Product>>();
		
		List<Product> list=productDao.queryProductAll();
		
		List<AttrBeen> aList=attrDao.selectList();
		
		for (AttrBeen attrBeen : aList) {
			List<Product> lp=new ArrayList<Product>();
			for (Product product : list) {
				if (product.getAttr().equals(attrBeen.getId())) {
					lp.add(product);
				}
			}
			map.put(attrBeen.getId(), lp);
		}
		model.addAttribute("products", map);
		model.addAttribute("attrs", aList);
	}
	@Override
	public void productinfo(String id, Model model) {
		
		model.addAttribute("product", productDao.selectProductById(id));
	}
	

}
