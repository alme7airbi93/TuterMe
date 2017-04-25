package ae.tutorme.controller;

import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.*;
import ae.tutorme.service.imp.TutormeMailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.security.Principal;

/**
 * Created by Ali AL-Zaabi on 2/17/2017.
 */
@Controller
public class HomeMVC {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private TutormeMailSender tutormeMailSender;

    @RequestMapping("/")
    public String home(Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            Student student = new Student();
            Instructor instructor = new Instructor();
            model.addAttribute("guest", student);
            model.addAttribute("instructor", student);
        }
        return "index";
    }


    @RequestMapping("/home")
    public String home(Principal principal, HttpSession session) {
        String userName = principal.getName();
        User user = userDAO.getUserBuUserName(userName);
        session.setAttribute("user", user);
        return "index";
    }

    @RequestMapping("/categories")
    public String categories(Model model) {

        return "categories";
    }

    @RequestMapping("/instructor/createcourse")
    public String createCourse(Model model) {

        Course course = new Course();
        model.addAttribute("savecourse",course);
        return "createcourse";
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String studentReg(@ModelAttribute("student") Student student) {
        createUser(student);
        return "vertification";
    }

    @RequestMapping(value = "/instructor/register", method = RequestMethod.POST)
    public String instructorReg(@ModelAttribute("instructor") Instructor instructor) {
        createUser(instructor);
        return "vertification";
    }

    public User createUser(User user) {
        Activation activation = new Activation();
        activation.setUser(user);
        Authorization authorization = new Authorization();
        authorization.setUser(user);
        user.setActivation(activation);
        user.setAuthorization(authorization);
        userDAO.saveUser(user);
        tutormeMailSender.sendVirfication(user);
        return user;

    }

}
