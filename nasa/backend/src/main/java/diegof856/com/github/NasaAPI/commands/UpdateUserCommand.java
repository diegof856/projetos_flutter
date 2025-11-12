package diegof856.com.github.NasaAPI.commands;

import diegof856.com.github.NasaAPI.mediator.Command;

import java.util.UUID;

public record UpdateUserCommand(UUID id, String nome, String email, String senha) implements Command<Void> {
}
