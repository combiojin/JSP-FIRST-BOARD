package com.cambio.board;

public class staticValues {
	
	public String oracle;
	public String dburl;
	public String dbuser;
	public String dbpw;
	private static staticValues sv = new staticValues();
	
	private staticValues() {
		oracle = "oracle.jdbc.driver.OracleDriver";
		dburl = "jdbc:oracle:thin:@localhost:1521:xe";
		dbuser = "hr";
		dbpw = "1234";
	}
	
	public static staticValues getInstance() {
		return sv;
	}
}
