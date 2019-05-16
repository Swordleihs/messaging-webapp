package domain;

import java.util.List;

import db.ConversationRepository;
import db.ConversationRepositoryStub;
import db.PersonRepository;
import db.PersonRepositoryStub;

public class Service {
	private PersonRepository personRepository = new PersonRepositoryStub();
	private ConversationRepository conversationRepository = new ConversationRepositoryStub();

	public Service(){
	}
	
	public Person getPerson(String personId)  {
		return this.personRepository.get(personId);
	}

	public List<Person> getPersons() {
		return this.getPersonRepository().getAll();
	}

	public void addPerson(Person person) {
		getPersonRepository().add(person);
	}

	public void updatePersons(Person person) {
		getPersonRepository().update(person);
	}

	public void deletePerson(String id) {
		getPersonRepository().delete(id);
	}
	
	public Person getAuthenticatedUser(String email, String password) {
		return getPersonRepository().getAuthenticatedUser(email, password);
	}

	private PersonRepository getPersonRepository() {
		return personRepository;
	}

	public void addConversation(Conversation c){
		this.conversationRepository.add(c);
    }

    public Conversation getConversation(Person p0, Person p1){
	    return this.conversationRepository.get(p0, p1);
    }

    public void updateConversation(Conversation c){
	    this.conversationRepository.updateConversation(c);
    }

    public List<Conversation> getAllConversations(){
	    return this.conversationRepository.getAll();
    }

    public void addMessageToConversation(Message m, Person p0, Person p1){
	    this.conversationRepository.addMessage(m, p0, p1);
    }
}
