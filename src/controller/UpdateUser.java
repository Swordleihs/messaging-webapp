package controller;

import domain.Gender;
import domain.Person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateUser extends AsyncroRequestHandler {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        Gender genderG = null;
        if(gender.equalsIgnoreCase("m") || gender.equalsIgnoreCase("male")){
            genderG = Gender.MALE;
        }else{
            genderG = Gender.FEMALE;
        }
        int age = Integer.parseInt(request.getParameter("age"));
        Person p = this.getPersonService().getPerson(id);
        p.setAge(age);
        p.setGender(genderG);
        p.setFirstName(firstname);
        p.setLastName(name);
        this.getPersonService().updatePersons(p);
        response.setHeader("Access-Control-Allow-Origin", "*");
        return "";
    }
}
