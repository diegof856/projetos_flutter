package diegof856.com.github.NasaAPI.mediator.handler;

import diegof856.com.github.NasaAPI.commands.UpdateUserCommand;
import diegof856.com.github.NasaAPI.entity.User;
import diegof856.com.github.NasaAPI.exceptions.NotFoundUser;
import diegof856.com.github.NasaAPI.mediator.RequestHandler;
import diegof856.com.github.NasaAPI.repository.RepositoryUser;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Transactional
public class UpdateUserHandler implements RequestHandler<UpdateUserCommand, Void> {
    private final RepositoryUser repository;
    @Override
    public Void handle(UpdateUserCommand request) {
        User user = this.repository.findById(request.id()).orElseThrow(()->new NotFoundUser("Usuario não encontrado"));
        user.setEmail(request.email());
        user.setPassword(request.senha());
        user.setName(request.nome());
        this.repository.save(user);
        return null;
    }
}
