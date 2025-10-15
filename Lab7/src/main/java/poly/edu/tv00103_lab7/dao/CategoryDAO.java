package poly.edu.tv00103_lab7.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import poly.edu.tv00103_lab7.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, String> {
}
