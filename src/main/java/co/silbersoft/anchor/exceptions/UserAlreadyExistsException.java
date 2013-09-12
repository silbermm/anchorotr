package co.silbersoft.anchor.exceptions;


public class UserAlreadyExistsException extends RuntimeException {

    public UserAlreadyExistsException(String msg){
        super(msg);
    }
    
}
