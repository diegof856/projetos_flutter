package diegof856.com.github.NasaAPI.mediator;

public interface Mediator {
    <R> R send(Request<R> request);


}
