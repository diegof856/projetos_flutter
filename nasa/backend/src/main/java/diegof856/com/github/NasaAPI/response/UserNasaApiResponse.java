package diegof856.com.github.NasaAPI.response;

import java.time.LocalDate;
import java.time.LocalTime;

public record UserNasaApiResponse(String id, String titulo, String descricao, String concluido, LocalDate data, LocalTime hora, String OcorrenciaNatural) {
}
