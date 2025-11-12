package diegof856.com.github.NasaAPI.commands;

import diegof856.com.github.NasaAPI.mediator.Command;

import java.util.UUID;

public record DeleteUserCommand(UUID id) implements Command<Void> {
}
