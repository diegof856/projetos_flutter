package diegof856.com.github.NasaAPI.commands;

import diegof856.com.github.NasaAPI.mediator.Command;
import diegof856.com.github.NasaAPI.entity.User;

public record CreateUserCommand(
        String nome, String email, String senha) implements Command<User> {
}
