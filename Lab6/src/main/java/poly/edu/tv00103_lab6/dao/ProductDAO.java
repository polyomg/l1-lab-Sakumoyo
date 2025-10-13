package poly.edu.tv00103_lab6.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import poly.edu.tv00103_lab6.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {
}
