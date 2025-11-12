package diegof856.com.github.NasaAPI.controller.common;


import diegof856.com.github.NasaAPI.exceptions.NotFoundUser;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice
public class GlobalExpectionsHanlder {

    @ExceptionHandler(NotFoundUser.class)
    private ResponseEntity<Object> notFoundHadler(NotFoundUser exception){
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(errorBody(exception.getMessage(),HttpStatus.NOT_FOUND));
    }
    private Map<String,Object> errorBody(Object message , Object httpStatus){
        Map<String, Object> body = new HashMap<>();
        body.put("Erro",message);
        body.put("Status", httpStatus);
        return body;
    }
}
