package diegof856.com.github.NasaAPI.mediator.handler;

import diegof856.com.github.NasaAPI.commands.DeleteUserCommand;
import diegof856.com.github.NasaAPI.mediator.RequestHandler;
import diegof856.com.github.NasaAPI.repository.RepositoryUser;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class DeleteUserHandler implements RequestHandler<DeleteUserCommand,Void> {
    private final RepositoryUser repository;
    @Override
    public Void handle(DeleteUserCommand request) {
        this.repository.deleteById(request.id());
        return null;
    }
}
