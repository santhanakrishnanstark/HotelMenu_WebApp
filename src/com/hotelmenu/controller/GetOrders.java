package com.hotelmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.hotelmenu.service.DbConnect;
 
@WebServlet("/views/GetOrders")
public class GetOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetOrders() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out;
		long millis=System.currentTimeMillis();
		String orders[] = null;
		int len=0;
		try {
			out = response.getWriter();
			String userId= request.getParameter("userId");
			String tableNo= request.getParameter("tableNo");
			Date date = new Date(millis);
			Statement st = DbConnect.getConnection();
			ResultSet rs = st.executeQuery("select * from orders where user_id='"+userId+"' and table_no='"+tableNo+"' and date='"+date+"' and delivery_status='delivered' ");
			while(rs.next()) {
				++len;
			}
			rs.close();
			st.close();
			Statement st1 = DbConnect.getConnection();
			ResultSet rs1 = st1.executeQuery("select * from orders where user_id='"+userId+"' and table_no='"+tableNo+"' and date='"+date+"' and delivery_status='delivered' ");
			orders = new String[len];
			int i = 0; 
			while(rs1.next()) {
			orders[i] = rs1.getString("food_name") + "_"+rs1.getString("food_qty")+"_"+rs1.getString("food_price");
				i++;
			}
			
			for(int a=0; a<orders.length; a++) {
				out.print(orders[a]+"&");
			} 
			
		}catch(Exception e) {
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
