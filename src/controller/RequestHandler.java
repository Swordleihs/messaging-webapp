package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import domain.Person;
import domain.Role;
import domain.Service;

public abstract class RequestHandler {
	
	private Service service;
	
	public abstract String handleRequest (HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException;
	
	public void setModel (Service personService) {
		this.service = personService;
	}

	public Service getPersonService() {
		return this.service;
	}
	
	protected boolean isFromUserWithRole (HttpServletRequest request, Role role) {
		Person person = (Person) request.getSession().getAttribute("user");
		if (person != null && person.getRole().equals(role)) {
			return true;
		}
		return false;
	}

}
