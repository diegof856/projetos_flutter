package diegof856.com.github.NasaAPI.mediator.handler;

import diegof856.com.github.NasaAPI.entity.User;
import diegof856.com.github.NasaAPI.exceptions.NotFoundUser;
import diegof856.com.github.NasaAPI.mapper.UserMapper;
import diegof856.com.github.NasaAPI.mediator.RequestHandler;
import diegof856.com.github.NasaAPI.queries.GetUserByIdQuery;
import diegof856.com.github.NasaAPI.repository.RepositoryUser;
import diegof856.com.github.NasaAPI.response.UserResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class GetUserByIdHandler implements RequestHandler<GetUserByIdQuery, UserResponse> {
    private final UserMapper mapper;
    private final RepositoryUser repository;
    @Override
    public UserResponse handle(GetUserByIdQuery request) {
        User user = this.repository.findById(request.id()).orElseThrow(()->new NotFoundUser("Usuario não encontrado"));
        return this.mapper.toResponse(user);
    }
}
