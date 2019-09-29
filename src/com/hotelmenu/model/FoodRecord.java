package com.hotelmenu.model;

import java.sql.Statement;

import com.hotelmenu.service.DbConnect;

public class FoodRecord {
	private String food_id;
	private String name;
	private String cost;
	private int availability;
	private String category;
	private String errorMessage;	
	
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public int getAvailability() {
		return availability;
	}
	public void setAvailability(int availability) {
		this.availability = availability;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	} 
	public String getErrorMessage() {
		return errorMessage;
	}
	
	public boolean saveFood() {
		try {
			// Save code here
			Statement st = DbConnect.getConnection();
			int res = st.executeUpdate("insert into food_record(food_id, name, cost, availability, category) values('"+getFood_id()+"', '"+getName()+"', '"+getCost()+"', '"+getAvailability()+"', '"+getCategory()+"') ");
			if(res >=0) {
				return true;
			}
		}catch(Exception e) {
			this.errorMessage = e.getMessage();
		}
		return false;
	}
	public boolean updateFood() {
		try {
			// Update code here
			Statement st = DbConnect.getConnection();
			int res = st.executeUpdate("update food_record set name='"+getName()+"', cost='"+getCost()+"', availability='"+getAvailability()+"', category='"+getCategory()+"' where food_id='"+getFood_id()+"' ");
			if(res >=0) {
				return true;
			}
		}catch(Exception e) {
			this.errorMessage = e.getMessage();
		}
		return false;
	}
	public boolean deleteFood() {
		try {
			// Delete code here
			Statement st = DbConnect.getConnection();
			int res = st.executeUpdate("delete from food_record where food_id='"+getFood_id()+"' ");
			if(res >=0) {
				return true;
			} 
		}catch(Exception e) {
			this.errorMessage = e.getMessage();
		}
		return false;
	}
}
