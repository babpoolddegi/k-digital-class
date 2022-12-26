package com.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConnection;

public class ProductDAOImpl implements ProductDAO{
	private static ProductDAO instance = new ProductDAOImpl();
	public static ProductDAO getInstance() {
		return instance;
	}
	
	@Override
	public void productInsert(Product product) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DBConnection.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("insert into product");
			sb.append("(p_productId, p_pname, p_unitPrice, p_description, p_manufacturer, p_category, ");
			sb.append("p_unitsInStock, p_condition, p_filename)");
			sb.append("values(product_seq.nextval,?,?,?,?,?,?,?,?)");
			ps=con.prepareStatement(sb.toString());
			ps.setString(1, product.getPname());
			ps.setInt(2, product.getUnitPrice());
			ps.setString(3, product.getDescription());
			ps.setString(4, product.getManufacturer());
			ps.setString(5, product.getCategory());
			ps.setLong(6, product.getUnitsInStock());
			ps.setString(7, product.getCondition());
			ps.setString(8, product.getFilename());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}

	@Override
	public ArrayList<Product> productAllfind() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Product> arr = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from product");
			while(rs.next()) {
				Product products = new Product();
				products.setCategory(rs.getString("p_category"));
				products.setCondition(rs.getString("p_condition"));
				products.setDescription(rs.getString("p_description"));
				products.setFilename(rs.getString("p_filename"));
				products.setManufacturer(rs.getString("p_manufacturer"));
				products.setPname(rs.getString("p_pname"));
				products.setUnitPrice(rs.getInt("p_unitprice"));
				products.setUnitsInStock(rs.getLong("p_unitsinstock"));
				products.setProductId(rs.getLong("p_productid"));
				arr.add(products);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}

	@Override
	public Product findById(Long productId) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Product product = null;
		
		try {
			con = DBConnection.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from product where p_productid="+productId);
			if(rs.next()) {
				product = new Product();
				product.setProductId(rs.getLong("p_productid"));
				product.setCategory(rs.getString("p_category"));
				product.setCondition(rs.getString("p_condition"));
				product.setDescription(rs.getString("p_description"));
				product.setFilename(rs.getString("p_filename"));
				product.setManufacturer(rs.getString("p_manufacturer"));
				product.setPname(rs.getString("p_pname"));
				product.setUnitPrice(rs.getInt("p_unitprice"));
				product.setUnitsInStock(rs.getLong("p_unitsinstock"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return product;
	}
	private void closeConnection(Connection con, PreparedStatement ps,
			Statement st, ResultSet rs) {
			try {
				if(con !=null) 			con.close();
				if(ps !=null) 				ps.close();
				if(st !=null) 				st.close();
				if(rs !=null) 				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
		}
		
	}
}
