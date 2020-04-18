package com.liu.graduation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.liu.graduation.entities.Address;
import com.liu.graduation.entities.Order;
import com.liu.graduation.entities.Order_logistics;
import com.liu.graduation.entities.Order_product;

public interface OrderDao {
	
	public int insertOrder(Order order);
	public int insertAddress(Address address);
	public int insertOrder_logistics(Order_logistics order_logistics);
	public int insertOrder_product(Order_product order_product);
	public Order findOrderByid(@Param("id") String id);
	public List<Order> findOrderByUser(@Param("user") String user);
	public Address findAddressByid(@Param("id") String id);
	public Order_logistics findOrder_logisticsByid(@Param("id") String id);
	public List<Order_product> findOrder_productByid(@Param("id") String id);
	public int updateOrder(@Param("id") String id,@Param("status") String status,@Param("way") String way);
	public int updateOrder_productRemark(@Param("order")String order, @Param("remark")String remark);
	public List<Order> findOrder(@Param("user")String user,@Param("status") String status);
	public List<Order> findAllOrder(@Param("user")String user,@Param("status") String status,@Param("key") String key);
	public int updateOrder_logistics(@Param("order")String order,@Param("id")String id);
	public List<Order_product> remarkProductList(@Param("user")String user, @Param("remark")String remark);
}
