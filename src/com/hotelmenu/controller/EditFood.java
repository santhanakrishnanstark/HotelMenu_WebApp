package com.hotelmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmenu.model.FoodRecord;

@WebServlet("/cms/EditFood")
public class EditFood extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditFood() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out;
		String category = "";
		try {
			out = response.getWriter();
			
			FoodRecord food = new FoodRecord();
			food.setFood_id(request.getParameter("foodId"));
			food.setName(request.getParameter("foodName"));
			food.setCost(request.getParameter("foodCost"));
			food.setAvailability(Integer.parseInt(request.getParameter("availability")));
			
			String categories[] = request.getParameterValues("category[]");
			for(int i=0; i<categories.length; i++) {
				category += " "+categories[i];
			}
			food.setCategory(category.trim());
		
			if(food.updateFood()) {
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
