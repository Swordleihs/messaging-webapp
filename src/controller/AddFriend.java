package controller;

import domain.Person;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddFriend extends RequestHandler {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");

        HttpSession session = request.getSession();
        Person user = (Person) session.getAttribute("user");

        Person p = this.getPersonService().getPerson(id);

        p.addFriend(user);
        this.getPersonService().updatePersons(p);

        user.addFriend(p);
        session.setAttribute("user", user);

        return null;
    }
}
