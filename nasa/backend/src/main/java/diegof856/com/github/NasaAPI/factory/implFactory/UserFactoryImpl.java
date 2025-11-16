package diegof856.com.github.NasaAPI.factory.implFactory;

import diegof856.com.github.NasaAPI.commands.CreateUserCommand;
import diegof856.com.github.NasaAPI.commands.DeleteUserCommand;
import diegof856.com.github.NasaAPI.commands.UpdateUserCommand;
import diegof856.com.github.NasaAPI.factory.UserFactory;
import diegof856.com.github.NasaAPI.entity.User;
import diegof856.com.github.NasaAPI.queries.GetSearchByYearQuery;
import diegof856.com.github.NasaAPI.queries.GetUserByIdQuery;
import diegof856.com.github.NasaAPI.response.NasaApiResponse;
import diegof856.com.github.NasaAPI.response.UserNasaApiResponse;
import diegof856.com.github.NasaAPI.response.UserResponse;
import diegof856.com.github.NasaAPI.response.request.NasaApiRequest;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
public class UserFactoryImpl implements UserFactory {
    @Override
    public User createUser(CreateUserCommand command) {
        User user = new User();
        user.setEmail(command.email());
        user.setName(command.nome());
        user.setPassword(command.senha());
        return user;
    }

    @Override
    public UserResponse createUserResponse(User user, List<UserNasaApiResponse> response) {
        return new UserResponse(user.getId(),user.getName(),user.getEmail(), response);
    }


    @Override
    public UpdateUserCommand createUpdateCommand(String id,UpdateUserCommand command) {
        return new UpdateUserCommand(UUID.fromString(id),command.nome(), command.email(), command.senha());
    }

    @Override
    public DeleteUserCommand createDeleteCommand(String id) {
        return new DeleteUserCommand(UUID.fromString(id));
    }

    @Override
    public GetUserByIdQuery createUserByIdQuery(String id) {
        return new GetUserByIdQuery(UUID.fromString(id));
    }

    @Override
    public List<UserNasaApiResponse> createUserNasaApiResponse(NasaApiRequest nasaApiRequest) {
        List<UserNasaApiResponse> nasaApiResponses = nasaApiRequest.events().stream().map(objRes ->this.transformNASAResponseUserResponse(objRes)).collect(Collectors.toList());
        return nasaApiResponses;
    }

    @Override
    public GetSearchByYearQuery createSearchYearQuery(String year) {
        return new GetSearchByYearQuery(year);
    }


    private UserNasaApiResponse transformNASAResponseUserResponse(NasaApiResponse nasaApiResponse){
        OffsetDateTime offsetDateTime = OffsetDateTime.parse(nasaApiResponse.geometry().get(0).date());
        LocalDate date = offsetDateTime.toLocalDate();
        LocalTime hour = offsetDateTime.toLocalTime();
        String formatted ="0.00";
        Double num = 0.0;
        if (nasaApiResponse.geometry().get(0).magnitudeValue() == null || nasaApiResponse.geometry().get(0).magnitudeValue().isBlank()){
            return this.checkIfTheValueIsNull(formatted,date,hour,nasaApiResponse);
        }
       if(nasaApiResponse.categories().get(0).title().equals("Wildfires")){
           num = Double.valueOf(nasaApiResponse.geometry().get(0).magnitudeValue());
           num =  (num * 0.404685642);
           formatted = String.format("%.2f", num) + "ha";
       }else{
          num = Double.valueOf(nasaApiResponse.geometry().get(0).magnitudeValue());
           num =  (num * 1.852);
           formatted = String.format("%.2f", num) + "km/h";
       }
        String status = nasaApiResponse.closed() == null ? "Active" : "Finished";
        String description = nasaApiResponse.description() == null ?"Not yet":nasaApiResponse.description();
        return new UserNasaApiResponse(nasaApiResponse.id(),nasaApiResponse.categories().get(0).title(),description,status,date,hour,formatted);

    }
    private UserNasaApiResponse checkIfTheValueIsNull(String formatted,LocalDate date,  LocalTime hour, NasaApiResponse nasaApiResponse){

        String status = nasaApiResponse.closed() == null ?"Active" : "Finished";
        String description = nasaApiResponse.description() == null ? "Not yet" : nasaApiResponse.description();
        return new UserNasaApiResponse(
                nasaApiResponse.id(),
                nasaApiResponse.categories().get(0).title(),
                description,
                status,
                date,
                hour,
                formatted
        );

    }
}
