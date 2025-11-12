package diegof856.com.github.NasaAPI.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "codigo")
public class RecoveryCode {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(length = 4,nullable = false)
    private Integer cod;

    @ManyToOne
    @JoinColumn(name = "codeRec")
    private User id_user;

}
