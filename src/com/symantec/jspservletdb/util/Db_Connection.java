package com.symantec.jspservletdb.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Db_Connection {
	
	public static	Connection con=null;
	public static Connection getcConnection(){
		if ( con != null)
		{
			return con ;
		}
		else{

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(Db_Connection.class.getName()).log(Level.SEVERE, null, ex);
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost/testdb", "admin", "admin123");
		} catch (SQLException ex) {
			Logger.getLogger(Db_Connection.class.getName()).log(Level.SEVERE, null, ex);
		}

		return con;
	}
	}

}
