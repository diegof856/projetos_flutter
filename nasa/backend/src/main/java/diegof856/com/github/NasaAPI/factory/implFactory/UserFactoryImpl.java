package diegof856.com.github.NasaAPI.factory.implFactory;

import diegof856.com.github.NasaAPI.commands.CreateUserCommand;
import diegof856.com.github.NasaAPI.commands.DeleteUserCommand;
import diegof856.com.github.NasaAPI.commands.UpdateUserCommand;
import diegof856.com.github.NasaAPI.factory.UserFactory;
import diegof856.com.github.NasaAPI.entity.User;
import diegof856.com.github.NasaAPI.queries.GetUserByIdQuery;
import diegof856.com.github.NasaAPI.response.UserResponse;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class UserFactoryImpl implements UserFactory {
    @Override
    public User createUser(CreateUserCommand command) {
        User user = new User();
        user.setEmail(command.email());
        user.setName(command.nome());
        user.setPassword(command.senha());
        return user;
    }

    @Override
    public UserResponse createUserResponse(User user) {
        return new UserResponse(user.getId(),user.getName(),user.getEmail());
    }


    @Override
    public UpdateUserCommand createUpdateCommand(String id,UpdateUserCommand command) {
        return new UpdateUserCommand(UUID.fromString(id),command.nome(), command.email(), command.senha());
    }

    @Override
    public DeleteUserCommand createDeleteCommand(String id) {
        return new DeleteUserCommand(UUID.fromString(id));
    }

    @Override
    public GetUserByIdQuery createUserByIdQuery(String id) {
        return new GetUserByIdQuery(UUID.fromString(id));
    }
}
