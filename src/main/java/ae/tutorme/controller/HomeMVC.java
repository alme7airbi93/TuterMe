package ae.tutorme.controller;

import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.Activation;
import ae.tutorme.model.Authorization;
import ae.tutorme.model.Student;
import ae.tutorme.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by Ali AL-Zaabi on 2/17/2017.
 */
@Controller
public class HomeMVC {

    @Autowired
    private UserDAO userDAO;

    @RequestMapping("/")
    public String home(Model model)
    {
        Student student = new Student();
        student.setUserName("Guest");
        model.addAttribute("student",student);
        return "index";
    }



    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String reg(@ModelAttribute("student") Student student,HttpSession session)
    {
        Activation activation = new Activation();
        activation.setUser(student);
        Authorization authorization = new Authorization();
        authorization.setUser(student);
        student.setActivation(activation);
        student.setAuthorization(authorization);
        userDAO.saveUser(student);

        session.setAttribute("user",student);
        return "index";
    }

    @RequestMapping("/login")
    public String login(@ModelAttribute("student")User student, HttpSession session)
    {
        userDAO.saveUser(student);
        session.setAttribute("student",student);
        return "index";
    }
}
