package db;

import java.util.*;

import domain.Gender;
import domain.Person;
import domain.Role;

public class PersonRepositoryStub implements PersonRepository {
	private Map<String, Person> persons = new HashMap<String, Person>();
	
	public PersonRepositoryStub () {
		Person administrator = new Person("admin@ucll.be", "t", "Admin", "Makker", Role.ADMIN, 50, Gender.FEMALE);
		add(administrator);
		Person jan = new Person("jan@ucll.be", "t", "Jan", "Janssens", Role.USER, 30, Gender.MALE);
		add(jan);
		Person an = new Person("an@ucll.be", "t", "An", "Cornelissen", Role.USER, 25, Gender.FEMALE);
		add(an);
	}
	
	public Person get(String personId){
		if(personId == null || personId.trim().isEmpty()){
			throw new IllegalArgumentException("No id given");
		}
		return persons.get(personId);
	}
	
	public List<Person> getAll(){
		ArrayList<Person> persons = new ArrayList<>();
		Collection<Person> c = this.persons.values();
		for(Person p : c){
			persons.add(p);
		}
		return persons;
	}

	public void add(Person person){
		if(person == null){
			throw new IllegalArgumentException("No person given");
		}
		if (persons.containsKey(person.getUserId())) {
			throw new IllegalArgumentException("User already exists");
		}
		persons.put(person.getUserId(), person);
	}
	
	public void update(Person person){
		if(person == null){
			throw new IllegalArgumentException("No person given");
		}
		persons.put(person.getUserId(), person);
	}
	
	public void delete(String personId){
		if(personId == null){
			throw new IllegalArgumentException("No id given");
		}
		persons.remove(personId);
	}
	
	public Person getAuthenticatedUser(String email, String password) {
		Person person = get(email);
		
		if (person != null && person.isCorrectPassword(password)) {
			return person;
		}
		else {
			return null;
		}
	}
}
