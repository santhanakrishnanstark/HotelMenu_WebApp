package com.hotelmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmenu.service.DbConnect;

@WebServlet("/cms/DeliveryStatus")
public class DeliveryStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeliveryStatus() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out; 
		try {
			out = response.getWriter();
			String foodId = request.getParameter("foodId");
			String foodQty = request.getParameter("foodQty");
			String date = request.getParameter("date");
			String userId = request.getParameter("userId");
			 
			Statement st = DbConnect.getConnection();
			int res = st.executeUpdate("update orders set delivery_status='delivered' where food_id='"+foodId+"' and food_qty='"+foodQty+"' and date='"+date+"' and user_id='"+userId+"' ");
			if(res>=0) {
				out.print(true);
			}else { 
				out.print(false);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
