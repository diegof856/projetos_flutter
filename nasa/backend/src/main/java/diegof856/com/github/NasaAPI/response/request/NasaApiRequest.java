package diegof856.com.github.NasaAPI.response.request;

import diegof856.com.github.NasaAPI.response.NasaApiResponse;

import java.util.List;

public record NasaApiRequest(List<NasaApiResponse> events) {
}
