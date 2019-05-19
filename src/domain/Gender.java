package domain;

public enum Gender {
    MALE("Male"), FEMALE("Female");

    private String description;

    Gender(String description) {
        this.description = description;
    }

    Gender() {

    }

    public String getDescription() {
        return description;
    }
}
