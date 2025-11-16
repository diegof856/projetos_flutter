package diegof856.com.github.NasaAPI.queries;

import diegof856.com.github.NasaAPI.mediator.Query;
import diegof856.com.github.NasaAPI.response.UserNasaApiResponse;

import java.util.List;

public record GetSearchByYearQuery(String year) implements Query<List<UserNasaApiResponse>> {
}
