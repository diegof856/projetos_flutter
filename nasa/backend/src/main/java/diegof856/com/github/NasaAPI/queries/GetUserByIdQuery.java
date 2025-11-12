package diegof856.com.github.NasaAPI.queries;

import diegof856.com.github.NasaAPI.mediator.Query;
import diegof856.com.github.NasaAPI.response.UserResponse;

import java.util.UUID;

public record GetUserByIdQuery(UUID id) implements Query<UserResponse> {
}
