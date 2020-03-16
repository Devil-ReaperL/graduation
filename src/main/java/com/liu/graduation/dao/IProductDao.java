package com.liu.graduation.dao;



import java.util.List;

import com.liu.graduation.entities.Product;
import com.liu.graduation.entities.Remark;



public interface IProductDao {
    public Product findp(String n);
    public List<Remark> allremark();
    public int addcar(String phonenum,String product_id,String num);
}
