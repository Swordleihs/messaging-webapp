package controller;

import domain.Person;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class Chat extends RequestHandler {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Person pe = (Person) session.getAttribute("user");
        String name = pe.getFirstName();
        request.setAttribute("username", name);
        ArrayList<Person> friends = pe.getFriends();
        request.setAttribute("friends", friends);
        return "chat.jsp";
    }
}