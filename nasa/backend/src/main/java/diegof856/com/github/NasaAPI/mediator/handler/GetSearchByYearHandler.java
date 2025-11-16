package diegof856.com.github.NasaAPI.mediator.handler;

import diegof856.com.github.NasaAPI.mapper.UserMapper;
import diegof856.com.github.NasaAPI.mediator.RequestHandler;
import diegof856.com.github.NasaAPI.queries.GetSearchByYearQuery;
import diegof856.com.github.NasaAPI.response.UserNasaApiResponse;
import diegof856.com.github.NasaAPI.utils.Utils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class GetSearchByYearHandler implements RequestHandler<GetSearchByYearQuery, List<UserNasaApiResponse>> {
    private final UserMapper mapper;
    @Override
    public List<UserNasaApiResponse> handle(GetSearchByYearQuery request) {


        List<UserNasaApiResponse> responseList = this.mapper.toResponseNasaApi(Utils.apiNasaLookup(request.year()));

        return responseList;
    }
}
