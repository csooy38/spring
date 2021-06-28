package com.sist.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private JdbcTemplate template;
	private String sql;

	@Override
	public List<ProductDTO> getProductList() {
		List<ProductDTO> list = null;

		sql = "select * from products order by pnum desc";
		
		return list = this.template.query(sql, new RowMapper<ProductDTO>() {

			@Override
			public ProductDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductDTO dto = new ProductDTO();
				dto.setPnum(rs.getInt("pnum"));
				dto.setCategory_fk(rs.getString("category_fk"));
				dto.setProducts_name(rs.getString("products_name"));
				dto.setEp_code_fk(rs.getString("ep_code_fk"));
				dto.setInput_price(rs.getInt("input_price"));
				dto.setOutput_price(rs.getInt("output_price"));
				dto.setTrans_cost(rs.getInt("trans_cost"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setCompany(rs.getString("company"));
				dto.setStatus(rs.getString("status"));
				
				return dto;
			}
		});
		
	}

	@Override
	public int insertProduct(final ProductDTO dto) {
		sql = "select count(*) from products";
		
		final int count = this.template.queryForInt(sql);
		
		sql = "insert into products values(?, ?, ?, ?, ?, ?, ?, ?, ?, default)";
		
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, count + 1);
				ps.setString(2, dto.getCategory_fk());
				ps.setString(3, dto.getProducts_name());
				ps.setString(4, dto.getEp_code_fk());
				ps.setInt(5, dto.getInput_price());
				ps.setInt(6, dto.getOutput_price());
				ps.setInt(7, dto.getTrans_cost());
				ps.setInt(8, dto.getMileage());
				ps.setString(9, dto.getCompany());
			}
		});
	}

	@Override
	public ProductDTO getProductCont(int pnum) {

		sql = "select * from products where pnum = ?";
		
		return this.template.queryForObject(sql, new RowMapper<ProductDTO>() {

			@Override
			public ProductDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductDTO dto = new ProductDTO();
				dto.setPnum(rs.getInt("pnum"));
				dto.setCategory_fk(rs.getString("category_fk"));
				dto.setProducts_name(rs.getString("products_name"));
				dto.setEp_code_fk(rs.getString("ep_code_fk"));
				dto.setInput_price(rs.getInt("input_price"));
				dto.setOutput_price(rs.getInt("output_price"));
				dto.setTrans_cost(rs.getInt("trans_cost"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setCompany(rs.getString("company"));
				dto.setStatus(rs.getString("status"));
				return dto;
			}
		}, pnum);
	
	}

	@Override
	public int updateProduct(final ProductDTO dto) {
		
		sql = "update products set input_price = ?, output_price = ?, trans_cost = ?, mileage = ? where pnum = ?";
		
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, dto.getInput_price());
				ps.setInt(2, dto.getOutput_price());
				ps.setInt(3, dto.getTrans_cost());
				ps.setInt(4, dto.getMileage());
				ps.setInt(5, dto.getPnum());
			}
		});
	
	}

	@Override
	public int deleteProduct(final int pnum) {
		
		sql = "delete from products where pnum = ?";
		
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {

				ps.setInt(1, pnum);
				
			}
		});
	}

	@Override
	public List<CategoryDTO> categoryList() {
		List<CategoryDTO> cateList = null;
		
		sql = "select * from category";
		
		return cateList = this.template.query(sql, new RowMapper<CategoryDTO>() {

			@Override
			public CategoryDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				CategoryDTO dto = new CategoryDTO();
				dto.setCnum(rs.getInt("cnum"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				dto.setDelete_chk(rs.getString("delete_chk"));
				return dto;
			}
		});
	}

	@Override
	public List<ProductDTO> searchProductList(String field, String keyword) {
		List<ProductDTO> searchList = null;
		
		if(field.equals("product_name")) {
			sql = "select * from products where products_name like ? order by pnum desc";
		}else if(field.equals("company")) {
			sql = "select * from products where company like ? order by pnum desc";
		}
		
		return searchList = this.template.query(sql, new RowMapper<ProductDTO>() {

			@Override
			public ProductDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductDTO dto = new ProductDTO();
				dto.setPnum(rs.getInt("pnum"));
				dto.setCategory_fk(rs.getString("category_fk"));
				dto.setProducts_name(rs.getString("products_name"));
				dto.setEp_code_fk(rs.getString("ep_code_fk"));
				dto.setInput_price(rs.getInt("input_price"));
				dto.setOutput_price(rs.getInt("output_price"));
				dto.setTrans_cost(rs.getInt("trans_cost"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setCompany(rs.getString("company"));
				dto.setStatus(rs.getString("status"));
				return dto;
			}
		}, "%"+keyword+"%");
		
	}
	
	
	

}
