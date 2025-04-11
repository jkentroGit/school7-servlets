package gr.aueb.cf.schoolapp.mapper;

import gr.aueb.cf.schoolapp.core.RoleType;
import gr.aueb.cf.schoolapp.dto.*;
import gr.aueb.cf.schoolapp.model.Student;
import gr.aueb.cf.schoolapp.model.Teacher;
import gr.aueb.cf.schoolapp.model.User;

import java.util.Optional;

public class Mapper {

    private Mapper() {}

    public static Teacher mapTeacherInsertToModel(TeacherInsertDTO dto) {

        return new Teacher(null, dto.getFirstname(), dto.getLastname(), dto.getVat(),
                dto.getFatherName(), dto.getPhoneNum(), dto.getEmail(), dto.getStreet(), dto.getStreetNum(),
                dto.getZipCode(), dto.getCityId(), null, null, null);
    }

    public static Teacher mapTeacherUpdateToModel(TeacherUpdateDTO dto) {

        return new Teacher(dto.getId(), dto.getFirstname(), dto.getLastname(), dto.getVat(),
                dto.getFatherName(), dto.getPhoneNum(), dto.getEmail(), dto.getStreet(), dto.getStreetNum(),
                dto.getZipCode(), dto.getCityId(), null, null, null);
    }

    public static Optional<TeacherReadOnlyDTO> mapTeacherToReadOnlyDTO(Teacher teacher) {
        if (teacher == null) return Optional.empty();
        return Optional.of(new TeacherReadOnlyDTO(teacher.getId(), teacher.getUuid(), teacher.getFirstname(),
                teacher.getLastname(), teacher.getVat(), teacher.getFatherName(), teacher.getPhoneNum(),
                teacher.getEmail(), teacher.getStreet(), teacher.getStreetNum(), teacher.getZipCode(), teacher.getCityId()));
    }



    public static Student mapStudentInsertToModel(StudentInsertDTO dto) {

        return new Student(null, dto.getFirstname(), dto.getLastname(),
                dto.getFatherName(), dto.getPhoneNum(), dto.getEmail(), dto.getStreet(), dto.getStreetNum(),
                dto.getZipCode(), dto.getCityId(), null, null, null);
    }

    public static Student mapStudentUpdateToModel(StudentUpdateDTO dto) {

        return new Student(dto.getId(), dto.getFirstname(), dto.getLastname(),
                dto.getFatherName(), dto.getPhoneNum(), dto.getEmail(), dto.getStreet(), dto.getStreetNum(),
                dto.getZipCode(), dto.getCityId(), null, null, null);
    }

    public static Optional<StudentReadOnlyDTO> mapStudentToReadOnlyDTO(Student student) {
        if (student == null) return Optional.empty();
        return Optional.of(new StudentReadOnlyDTO(student.getId(), student.getUuid(), student.getFirstname(),
                student.getLastname(), student.getFatherName(), student.getPhoneNum(),
                student.getEmail(), student.getStreet(), student.getStreetNum(), student.getZipCode(), student.getCityId()));
    }



    public static UserReadOnlyDTO mapToReadOnlyDTO(User user) {
        return new UserReadOnlyDTO(user.getId(), user.getUsername(), user.getPassword());
    }

    public static User mapToUser(InsertUserDTO dto) {
        return new User(null, dto.getUsername(), dto.getPassword(), RoleType.valueOf(dto.getRole()));
    }

}
