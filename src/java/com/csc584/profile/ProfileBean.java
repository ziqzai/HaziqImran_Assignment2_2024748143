package com.csc584.profile;

public class ProfileBean {
    private int id;
    private String name;
    private String studentId;
    private String program;
    private String email;
    private String phone;
    private String hobbies;
    private String about;

    public ProfileBean() {}

    public ProfileBean(String name, String studentId, String program,
                       String email, String phone, String hobbies, String about) {
        this.name = name;
        this.studentId = studentId;
        this.program = program;
        this.email = email;
        this.phone = phone;
        this.hobbies = hobbies;
        this.about = about;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getStudentId() { return studentId; }
    public void setStudentId(String studentId) { this.studentId = studentId; }

    public String getProgram() { return program; }
    public void setProgram(String program) { this.program = program; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getHobbies() { return hobbies; }
    public void setHobbies(String hobbies) { this.hobbies = hobbies; }

    public String getAbout() { return about; }
    public void setAbout(String about) { this.about = about; }
}
