package poly.edu.tv00103_lab6.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "Accounts")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Account implements Serializable {
    @Id
    private String username;
    private String password;
    private String fullname;
    private String email;
    private String photo;
    private boolean active;
    private boolean admin;
    @OneToMany(mappedBy = "account")
    List<Order> orders;
}
