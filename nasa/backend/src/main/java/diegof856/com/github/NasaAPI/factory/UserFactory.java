package diegof856.com.github.NasaAPI.factory;

import diegof856.com.github.NasaAPI.commands.CreateUserCommand;
import diegof856.com.github.NasaAPI.commands.DeleteUserCommand;
import diegof856.com.github.NasaAPI.commands.UpdateUserCommand;
import diegof856.com.github.NasaAPI.entity.User;

import diegof856.com.github.NasaAPI.queries.GetUserByIdQuery;
import diegof856.com.github.NasaAPI.response.UserResponse;

public interface UserFactory {
    User createUser(CreateUserCommand command);
    UserResponse createUserResponse(User user);
    UpdateUserCommand createUpdateCommand(String id, UpdateUserCommand command);
    DeleteUserCommand createDeleteCommand(String id);
    GetUserByIdQuery createUserByIdQuery(String id);
}
