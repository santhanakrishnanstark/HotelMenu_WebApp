package com.hotelmenu.model;

import java.sql.Date;
import java.sql.Statement;

import com.hotelmenu.service.DbConnect;

public class Orders {
	private String tableNo;
	private String userId;
	private Date date;
	private String foodName;
	private int foodQty;
	private String foodId;
	private int foodPrice;
	private String deliveryStatus = "Not Delivered";
	private String errorMessage;
	
	public String getTableNo() {
		return tableNo;
	}
	public void setTableNo(String tableNo) {
		this.tableNo = tableNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodQty() {
		return foodQty;
	}
	public void setFoodQty(int foodQty) {
		this.foodQty = foodQty;
	}
	public String getFoodId() {
		return foodId;
	}
	public void setFoodId(String foodId) {
		this.foodId = foodId;
	}
	public int getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public boolean saveOrder() {
		try {
			 // Save Order code
			Statement st = DbConnect.getConnection();
			int res = st.executeUpdate("insert into orders (table_no, user_id, date, food_name, food_qty, food_price, food_id, delivery_status) values ('"+getTableNo()+"', '"+getUserId()+"', '"+getDate()+"', '"+getFoodName()+"', '"+getFoodQty()+"', '"+getFoodPrice()+"', '"+getFoodId()+"', '"+this.deliveryStatus+"') ");
			if(res >=0) {
				return true;
			}
			
		}catch(Exception e) {
			this.errorMessage = e.getMessage();
		}
		return false;
	}

}
