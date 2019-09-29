package com.hotelmenu.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DbConnect {
private static Connection con;
	
	public static Statement getConnection() {
		Statement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelmenu","root",""); 
				st = con.createStatement(); 
			
		}catch(Exception e) {
			st = null;
		}
		return st;
	}
}
