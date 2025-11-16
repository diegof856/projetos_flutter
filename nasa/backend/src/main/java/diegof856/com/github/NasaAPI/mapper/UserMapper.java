package diegof856.com.github.NasaAPI.mapper;

import diegof856.com.github.NasaAPI.commands.CreateUserCommand;
import diegof856.com.github.NasaAPI.factory.UserFactory;
import diegof856.com.github.NasaAPI.entity.User;
import diegof856.com.github.NasaAPI.response.UserNasaApiResponse;
import diegof856.com.github.NasaAPI.response.UserResponse;
import diegof856.com.github.NasaAPI.response.request.NasaApiRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UserMapper {
    private final UserFactory factory;

    public User toEntity(CreateUserCommand command){
        return this.factory.createUser(command);
    }
    public UserResponse toResponse(User user,List<UserNasaApiResponse> responseList ){

        return this.factory.createUserResponse(user, responseList );
    }
    public List<UserNasaApiResponse> toResponseNasaApi(NasaApiRequest requestApi){
        return this.factory.createUserNasaApiResponse(requestApi);
    }
}
