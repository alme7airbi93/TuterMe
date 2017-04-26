package ae.tutorme.controller;

import ae.tutorme.dao.StudentDAO;
import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.Student;
import ae.tutorme.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by almehairbi on 2/28/17.
 */
@Controller
@RequestMapping("/student")
public class StudentMVC {

    @Autowired
    private StudentDAO studentDAO;

    @Autowired
    private UserDAO userDAO;


    @RequestMapping("/home")
    public String studentHome() {
        return "courses";
    }




}

