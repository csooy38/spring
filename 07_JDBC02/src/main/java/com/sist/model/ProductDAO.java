package com.sist.model;

import java.util.List;

public interface ProductDAO {
	
	List<ProductDTO> getProductList();
	int insertProduct(ProductDTO dto);
	ProductDTO getProductCont(int pnum);
	int updateProduct(ProductDTO dto);
	int deleteProduct(int pnum);
	List<CategoryDTO> categoryList();

}
