package com.hotelmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.hotelmenu.model.Orders;

@WebServlet("/views/PlaceOrder")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PlaceOrder() { 
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out;
		String orderJsonString;
		String foodId, foodQty, foodPrice;
		int ordersLength = 0;
		try {
			out = response.getWriter();
			String tableNo = request.getParameter("tableNo");
			String orders = request.getParameter("orders"); 
			String userId = request.getParameter("userId");
			JSONObject ordersObject = getJsonObj(orders);
			
		    for(Object key : ordersObject.keySet()) {
		    	orderJsonString = ordersObject.get(key).toString();
		    	JSONObject order = getJsonObj(orderJsonString);
		    	foodId = order.get("foodId").toString();
		    	foodQty = order.get("foodQty").toString();
		    	foodPrice = order.get("foodPrice").toString();
		    	
		    	if(placeOrder(userId, tableNo, foodId, foodQty, foodPrice)) {
		    		++ordersLength;
		    	}
		    }
		    
		    if(ordersLength == ordersObject.size()) {
		    	out.print(true);
		    }else {
		    	out.print(false);
		    }
		    
		}catch(Exception e) {
			System.err.println(e);
		}
	}

	private boolean placeOrder(String userId, String tableNo, String foodId, String foodQty, String foodPrice) {
	 long millis=System.currentTimeMillis();  
		Orders order = new Orders();
		order.setTableNo(tableNo);
		order.setFoodId(foodId);
		order.setFoodName(foodId.replaceAll("[0-9]", ""));
		order.setFoodQty(Integer.parseInt(foodQty));
		order.setFoodPrice(Integer.parseInt(foodPrice));
		order.setDate(new Date(millis)); 
		order.setUserId(userId);
		
		if(order.saveOrder()) {
			return true;
		}else {
			System.err.println(order.getErrorMessage());
		}
		return false;
	}
	
	private String generateId(String name) {
		int num1 = (int) (Math.random() * 99);
		int num2 = (int) (Math.random() * 99);
		return name.toUpperCase()+num2+""+num2;
	}

	private JSONObject getJsonObj(String orders) {
		Object obj=JSONValue.parse(orders);  
	    JSONObject jsonObject = (JSONObject) obj;
		return jsonObject;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
