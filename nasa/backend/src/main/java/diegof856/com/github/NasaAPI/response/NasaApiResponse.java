package diegof856.com.github.NasaAPI.response;

import diegof856.com.github.NasaAPI.response.request.CategoryApiRequest;
import diegof856.com.github.NasaAPI.response.request.GeometryApiRequest;

import java.util.List;

public record NasaApiResponse(String id, String description, String closed,List<CategoryApiRequest> categories, List<GeometryApiRequest> geometry) {


}
