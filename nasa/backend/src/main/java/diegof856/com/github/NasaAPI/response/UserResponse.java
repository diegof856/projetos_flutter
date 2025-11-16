package diegof856.com.github.NasaAPI.response;

import java.util.List;
import java.util.UUID;

public record UserResponse(UUID id, String nome,String email, List<UserNasaApiResponse> eventos) {
}
