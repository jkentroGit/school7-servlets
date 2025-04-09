package gr.aueb.cf.schoolapp.dao;

import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.model.Student;

import java.util.List;

public interface IStudentDAO {

    // Basic services
    Student insert(Student student) throws StudentDAOException;
    Student update(Student student) throws StudentDAOException;
    void delete(Integer id) throws StudentDAOException;
    Student getById(Integer id) throws StudentDAOException;
    Student getStudentByEmail(String email) throws StudentDAOException;
    List<Student> getAll() throws StudentDAOException;

    // Queries
    Student getByUUID(String uuid) throws StudentDAOException;
    List<Student> getByLastname(String lastname) throws StudentDAOException;
    List<Student> getFilteredStudents(String firstname, String lastname) throws StudentDAOException;
}