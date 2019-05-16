package domain;

public class Message {

    private String message;
    private Person sender;

    public Message(String m, Person p){
        this.setMessage(m);
        this.setSender(p);
    }

    public Message(){}

    public void setMessage(String m) {
        if(m.trim().isEmpty()){
            throw new DomainException("Empty message");
        }
        this.message = m;
    }

    public String getMessage(){
        return this.message;
    }

    public void setSender(Person p){
        if(p == null){
            throw new DomainException("invalid sender");
        }
        this.sender = p;
    }

    public Person getSender(){
        return this.sender;
    }
}
