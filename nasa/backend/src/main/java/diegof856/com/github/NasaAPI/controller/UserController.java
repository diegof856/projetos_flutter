package diegof856.com.github.NasaAPI.controller;

import diegof856.com.github.NasaAPI.commands.CreateUserCommand;
import diegof856.com.github.NasaAPI.commands.UpdateUserCommand;
import diegof856.com.github.NasaAPI.factory.UserFactory;
import diegof856.com.github.NasaAPI.mediator.Mediator;
import diegof856.com.github.NasaAPI.response.UserResponse;
import diegof856.com.github.NasaAPI.utils.Utils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
    private final Mediator mediator;
    private final UserFactory factory;
    @PostMapping
    public ResponseEntity<Void> saveUser(@RequestBody CreateUserCommand command){
        URI location = Utils.generateHeaderLocation(this.mediator.send(command).getId());
        return ResponseEntity.created(location).build();
    }
    @PutMapping("{id}")
    public ResponseEntity<Void> updateUser(@PathVariable("id") String id, @RequestBody UpdateUserCommand command){
        this.mediator.send(this.factory.createUpdateCommand(id,command));
        return ResponseEntity.noContent().build();
    }
    @DeleteMapping("{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable("id") String id){
        this.mediator.send(this.factory.createDeleteCommand(id));
        return ResponseEntity.noContent().build();
    }
    @GetMapping("{id}")
    public ResponseEntity<UserResponse> getUserById(@PathVariable("id") String id){
        return ResponseEntity.ok(this.mediator.send(this.factory.createUserByIdQuery(id)));
    }
}
