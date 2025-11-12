package diegof856.com.github.NasaAPI.mediator.handler;

import diegof856.com.github.NasaAPI.commands.CreateUserCommand;
import diegof856.com.github.NasaAPI.mapper.UserMapper;
import diegof856.com.github.NasaAPI.mediator.RequestHandler;
import diegof856.com.github.NasaAPI.repository.RepositoryUser;
import diegof856.com.github.NasaAPI.entity.User;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@Transactional
@RequiredArgsConstructor
public class CreateUserHandler implements RequestHandler<CreateUserCommand, User> {
    private final RepositoryUser repository;
    private final UserMapper mapper;
    @Override
    public User handle(CreateUserCommand request) {
        User user = this.mapper.toEntity(request);
        return this.repository.save(user);
    }
}
