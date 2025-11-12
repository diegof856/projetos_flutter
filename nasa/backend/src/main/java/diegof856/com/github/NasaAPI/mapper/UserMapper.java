package diegof856.com.github.NasaAPI.mapper;

import diegof856.com.github.NasaAPI.commands.CreateUserCommand;
import diegof856.com.github.NasaAPI.factory.UserFactory;
import diegof856.com.github.NasaAPI.entity.User;
import diegof856.com.github.NasaAPI.response.UserResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserMapper {
    private final UserFactory factory;

    public User toEntity(CreateUserCommand command){
        return this.factory.createUser(command);
    }
    public UserResponse toResponse(User user){
        return this.factory.createUserResponse(user);
    }
}
