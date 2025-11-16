package diegof856.com.github.NasaAPI.utils;


import diegof856.com.github.NasaAPI.response.request.NasaApiRequest;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.UUID;

public class Utils {
    public static URI generateHeaderLocation(UUID id){
        return ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(id).toUri();
    }
    public static NasaApiRequest apiNasaLookup(String year){
        RestTemplate restTemplate = new RestTemplate();

        return restTemplate.getForObject("https://eonet.gsfc.nasa.gov/api/v3/events?start="+year+"-01-01&end="+year+"-12-31&category=wildfires,severeStorms", NasaApiRequest.class);

    }

}
