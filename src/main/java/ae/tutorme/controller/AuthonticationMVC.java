package ae.tutorme.controller;

import ae.tutorme.dao.ActivationDAO;
import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.Activation;
import ae.tutorme.model.Student;
import ae.tutorme.model.User;
import ae.tutorme.service.imp.TutormeMailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Date;
import java.util.logging.Logger;

/**
 * Created by almehairbi on 4/23/17.
 */

@Controller
public class AuthonticationMVC {

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(Authentication.class);


    @Autowired
    private UserDAO userDAO;

    @Autowired
    private ActivationDAO activationDAO;

    @Autowired
    private TutormeMailSender tutormeMailSender;


    @RequestMapping("/login/fail/cred")
    public String authoncitachonFailCredintal(Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            Student student = new Student();
            model.addAttribute("guest", student);
        }
        return "login";
    }

    @RequestMapping("/login/fail/dis")
    public String authoncitachonFailDisabled() {

        return "vertification";
    }


    @RequestMapping("/virfication/{uuid}")
    public String verfication(@PathVariable String uuid) {
        if (uuid.equals("") || uuid == null) {
            return "404";
        }
        Activation activation = activationDAO.getByUUID(uuid);
        if (activation == null) {
            return "404";
        }

        User user = userDAO.getUserBuUserName(activation.getUser().getUserName());

        user.setEnabled(true);
        userDAO.updateProfile(user);

        return "index";
    }

    @RequestMapping(value = "/resend", method = RequestMethod.POST)
    public String resendCode(@RequestParam("userName")String userName, Model model) {
        User user = userDAO.getUserBuUserName(userName);
        if (user == null) {
            model.addAttribute("message", "We couldn't find this email in our system please register again");
            return "vertification";
        }

        tutormeMailSender.sendVirfication(user);
        model.addAttribute("message", "A verification email has been send again ");
        return "vertification";

    }

    @RequestMapping(value = "/resend", method = RequestMethod.GET)
    public String resend() {
        return "vertification";

    }




}

