package diegof856.com.github.NasaAPI.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Entity
@Data
@Table(name = "usuario")
@EntityListeners(AuditingEntityListener.class)
public class User {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    @Column(name = "nome", length = 35,nullable = false)
    private String name;
    @Column(name = "email", length = 100,nullable = false,unique = true)
    private String email;
    @Column(name = "senha",nullable = false)
    private String password;

    @OneToMany
    @JoinColumn(name = "id_user")
    private List<RecoveryCode> codeRec;

    @CreatedDate
    @Column(name = "data_criacao")
    private LocalDateTime registrationDate;

    @LastModifiedDate
    @Column(name = "data_atualização")
    private LocalDateTime updateDate;

}
