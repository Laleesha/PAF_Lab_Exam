package com.models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.models.DBConnection;

public class Seller {

	public String getSellers() {
		String sellersGrid = null;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
		con = DBConnection.createConnection(); //establishing connection
		st = con.createStatement(); 
		rs = st.executeQuery("select * from sellers"); 
		if (rs.first())
		{
			sellersGrid = "<table border='1' cellspacing='1'cellpadding='1'><tr><th>No</th><th>Name</th><th>Description</th><th>Edit</th><th>Delete</th></tr>";
		rs.beforeFirst();
		while(rs.next())
		{
			sellersGrid = sellersGrid + "<tr><td>" + rs.getString(1) + "</td>"+ "<td>" + rs.getString(2) + "</td>"+ "<td>" + rs.getString(3) + "</td>"+ "<td><input id=\"btnEdit\" type=\"button\" name=\"btnEdit\"param=\"" + rs.getString(1) + "\" value=\"Edit\"</td>"+ "<td>" + "<input id=\"btnRemove\" type=\"button\"name=\"btnRemove\" param=\"" + rs.getString(1) + "\"value=\"Remove\"</td></tr>";
		}
		}
		else
			sellersGrid = "There are no sellers...";
			sellersGrid = sellersGrid + "</table></br>";
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
			return sellersGrid;
		}
		public String saveAnSeller(String selrName, String selrAddr) {
			String res = null;
			String sql = null;
			Connection con = null;
			Statement st = null;
			try {
				con = DBConnection.createConnection(); 
				st = con.createStatement(); 
				sql = "insert into sellers (nameitems, descitems) values('" + selrName + "', '" + selrAddr + "')";
				st.executeUpdate(sql);
				res = "Successfully inserted...";
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
				return res;
		}
	
}
