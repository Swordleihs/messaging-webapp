package controller;

import domain.Gender;
import domain.Person;
import domain.Role;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class Register extends RequestHandler {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        List<String> errors = new ArrayList<String>();
        Person person = new Person();

        this.setFirstName(person, request, errors);
        this.setLastName(person, request, errors);
        this.setAge(person, request, errors);
        this.setEmail(person, request, errors);
        this.setPassword(person, request, errors);
        this.setGender(person, request, errors);
        person.setRole(Role.USER);
        person.setStatusInit();

        if (errors.size() < 1){
            try {
                this.getPersonService().addPerson(person);
                request.setAttribute("registerSucces", true);
                return "index.jsp";
            }catch(Exception e){
                errors.add(e.getMessage());
                request.setAttribute("errors", errors);
                return "register.jsp";
            }
        }else {
            request.setAttribute("errors", errors);
            return "register.jsp";
        }
    }

    private void setEmail(Person p, HttpServletRequest request, List<String> errors){
        String email = request.getParameter("email");
        try{
            p.setUserId(email);
            request.setAttribute("previousEmail", email);
        }catch(Exception e){
            errors.add(e.getMessage());
        }
    }

    private void setPassword(Person p, HttpServletRequest request, List<String> errors){
        String password = request.getParameter("password");
        String passwordCon = request.getParameter("passwordCon");
        if(!password.equals(passwordCon)){
            errors.add("Password does not match confirmation");
        }
        try{
            p.setPassword(password);
            p.setHashedPassword(password);
        }catch(Exception e){
            errors.add(e.getMessage());
        }
    }

    private void setFirstName(Person p, HttpServletRequest request, List<String> errors){
        String firstName = request.getParameter("firstname");
        try{
            p.setFirstName(firstName);
            request.setAttribute("previousFirstname", firstName);
        }catch(Exception e){
            errors.add(e.getMessage());
        }
    }

    private void setLastName(Person p, HttpServletRequest request, List<String> errors){
        String lastName = request.getParameter("lastname");
        try{
            p.setLastName(lastName);
            request.setAttribute("previousLastname", lastName);
        }catch(Exception e){
            errors.add(e.getMessage());
        }
    }

    private void setAge(Person p, HttpServletRequest request, List<String> errors){
        int age = Integer.parseInt(request.getParameter("age"));
        try{
            p.setAge(age);
            request.setAttribute("previousAge", age);
        }catch(Exception e){
            errors.add(e.getMessage());
        }
    }

    private void setGender(Person p, HttpServletRequest request, List<String> errors){
        String gender = request.getParameter("gender");
        if(gender.equals("Male")){
            p.setGender(Gender.MALE);
        }else if(gender.equals("Female")){
            p.setGender(Gender.FEMALE);
        }else{
            errors.add("Invalid gender");
        }
    }
}
