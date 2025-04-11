package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.dao.*;
import gr.aueb.cf.schoolapp.dto.StudentInsertDTO;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.exceptions.StudentAlreadyExistsException;
import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.model.City;
import gr.aueb.cf.schoolapp.model.Student;
import gr.aueb.cf.schoolapp.service.CityServiceImpl;
import gr.aueb.cf.schoolapp.service.ICityService;
import gr.aueb.cf.schoolapp.service.IStudentService;
import gr.aueb.cf.schoolapp.service.StudentServiceImpl;
import gr.aueb.cf.schoolapp.validator.StudentValidator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet("/school-app/students/insert")
public class StudentInsertController extends HttpServlet {

    IStudentDAO studentDAO = new StudentDAOImpl();
    IStudentService studentService = new StudentServiceImpl(studentDAO);
    ICityDAO cityDAO = new CityDAOImpl();
    ICityService cityService = new CityServiceImpl(cityDAO);

    StudentInsertDTO studentInsertDTO = new StudentInsertDTO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<City> cities = null;
        try {
            cities = cityService.getAllCities();
        } catch (SQLException e) {
            String errorMessage = e.getMessage();
            req.getSession().setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher("/WEB-INF/jsp/teacher-insert.jsp")
                    .forward(req, resp);
        }
        req.setAttribute("cities", cities);
        //req.getSession().setAttribute("insertDTO", teacherInsertDTO);
        if (req.getSession().getAttribute("insertDTO") != null) {
            // Move from session to request scope for JSP
            req.setAttribute("insertDTO", req.getSession().getAttribute("insertDTO"));
            //req.setAttribute("errors", req.getSession().getAttribute("errors"));

            // Clear session data (so it doesn't persist after refresh)
            req.getSession().removeAttribute("insertDTO");
            //req.getSession().removeAttribute("errors");
        }
        req.getRequestDispatcher("/WEB-INF/jsp/student-insert.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentInsertDTO insertDTO;
        Map<String, String> errors;
        String firstnameMessage;
        String lastnameMessage;

        String fathernameMessage;
        String phoneNumMessage;
        String emailMessage;
        String streetMessage;
        String streetNumMessage;
        String zipcodeMessage;
        String cityIdMessage;
        String errorMessage;
        Student student;

        // Data binding
        String firstname = (req.getParameter("firstname") != null) ? req.getParameter("firstname").trim() : "";
        String lastname = (req.getParameter("lastname") != null) ? req.getParameter("lastname").trim() : "";
        String fathername = (req.getParameter("fathername") != null) ? req.getParameter("fathername").trim() : "";
        String phoneNum = (req.getParameter("phoneNum") != null) ? req.getParameter("phoneNum").trim() : "";
        String email = (req.getParameter("email") != null) ? req.getParameter("email").trim() : "";
        String street = (req.getParameter("street") != null) ? req.getParameter("street").trim() : "";
        String streetNum = (req.getParameter("streetNum") != null) ? req.getParameter("streetNum").trim() : "";
        String zipcode = (req.getParameter("zipcode") != null) ? req.getParameter("zipcode").trim() : "";
        Integer cityId = (req.getParameter("cityId") != null) ? Integer.parseInt(req.getParameter("cityId").trim()) : 0;
        insertDTO = new StudentInsertDTO(firstname, lastname, fathername, phoneNum,
                email, street, streetNum, zipcode, cityId);


        try {
            // Validate dto
            errors = StudentValidator.validate(insertDTO);

            if (!errors.isEmpty()) {
                firstnameMessage = errors.getOrDefault("firstname", "");
                lastnameMessage = errors.getOrDefault("lastname", "");

                fathernameMessage = errors.getOrDefault("fathername", "");
                phoneNumMessage = errors.getOrDefault("phoneNum", "");
                // more ...

                req.getSession().setAttribute("firstnameMessage", firstnameMessage);
                req.getSession().setAttribute("lastnameMessage", lastnameMessage);

                req.getSession().setAttribute("fathernameMessage", fathernameMessage);
                req.getSession().setAttribute("phoneNumMessage", phoneNumMessage);
                req.getSession().setAttribute("insertDTO", insertDTO);
//                req.getRequestDispatcher("/WEB-INF/jsp/teacher-insert.jsp")
//                        .forward(req, resp);
                resp.sendRedirect(req.getContextPath() + "/school-app/students/insert");
                return;
            }

            // Call the service

            StudentReadOnlyDTO readOnlyDTO = studentService.insertStudent(insertDTO);
            HttpSession session = req.getSession(false);
            session.setAttribute("studentInfo", readOnlyDTO);
            // PRG Pattern
            resp.sendRedirect(req.getContextPath() + "/school-app/student-inserted");
//            req.getRequestDispatcher("/WEB-INF/jsp/teacher-inserted.jsp")
//                    .forward(req, resp);
        } catch (StudentDAOException | StudentAlreadyExistsException e) {
            errorMessage = e.getMessage();
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher("/WEB-INF/jsp/student-insert.jsp")
                    .forward(req, resp);
        }
    }

//    private TeacherReadOnlyDTO mapToReadOnlyDTO(Teacher teacher) {
//        return new TeacherReadOnlyDTO(teacher.getId(), teacher.getFirstname(), teacher.getLastname());
//    }
}