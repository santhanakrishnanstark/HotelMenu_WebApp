package com.hotelmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmenu.model.FoodRecord;

@WebServlet("/cms/DeleteFood")
public class DeleteFood extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteFood() {
        super(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out; 
		try {
			out = response.getWriter();
			String food_id = request.getParameter("food_id");
			FoodRecord food = new FoodRecord();
			food.setFood_id(food_id);
			
			if(food.deleteFood()) {
				response.sendRedirect("food_record.jsp");
			}else {
				out.print("Something went wrong ! "+ food.getErrorMessage());
			}
			
		}catch(Exception e) {
			System.err.print(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
