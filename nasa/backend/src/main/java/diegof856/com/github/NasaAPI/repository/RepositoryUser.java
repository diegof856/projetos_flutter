package diegof856.com.github.NasaAPI.repository;

import diegof856.com.github.NasaAPI.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface RepositoryUser extends JpaRepository<User,UUID> {
}
