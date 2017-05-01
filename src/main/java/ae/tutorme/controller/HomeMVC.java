package ae.tutorme.controller;

import ae.tutorme.dao.CategoryDAO;
import ae.tutorme.dao.CourseDAO;
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
import java.util.List;

/**
 * Created by Ali AL-Zaabi on 2/17/2017.
 */
@Controller
public class HomeMVC {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private TutormeMailSender tutormeMailSender;

    @Autowired
    private CategoryDAO categoryDAO;

    @Autowired
    private CourseDAO courseDAO;

    @RequestMapping("/")
    public String home(HttpSession session,Model model) {
        List<Category> categories = categoryDAO.getCategories();
        session.setAttribute("categories", categories);
        return "index";
    }


    @RequestMapping("/home")
    public String home(Principal principal, HttpSession session) {
        String userName = principal.getName();
        User user = userDAO.getUserBuUserName(userName);
        if (user == null) {
            return "404";
        }
        if (user instanceof Student) {
            Student student = (Student) user;
            session.setAttribute("user", student);
            return "redirect:/student/home";
        } else if (user instanceof Instructor) {
            Instructor instructor = (Instructor) user;
            session.setAttribute("user", instructor);
            return "redirect:/instructor/home";
        } else if (user instanceof Moderator) {
            Moderator moderator = (Moderator) user;
            session.setAttribute("user", moderator);
            return "redirect:/moderator/home";
        } else if (user instanceof Admin) {
            Admin admin = (Admin) user;
            session.setAttribute("user", admin);
            return "redirect:/admin/home";
        }else
        {
            return "404";
        }

    }

    @RequestMapping("/categories")
    public String categories(Model model) {

        return "categories";
    }



    @RequestMapping(value = "/register/student", method = RequestMethod.POST)
    public String studentReg(@ModelAttribute("Student") Student student) {
        createUser(student);
        return "vertification";
    }

    @RequestMapping(value = "/register/instructor", method = RequestMethod.POST)
    public String instructorReg(@ModelAttribute("Instructor") Instructor instructor) {
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
