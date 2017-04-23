package ae.tutorme.controller;

import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.User;
import ae.tutorme.service.imp.TutormeMailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.security.Principal;

/**
 * Created by almehairbi on 4/23/17.
 */

@Controller
public class Authontication {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private TutormeMailSender tutormeMailSender;



    @RequestMapping("/login/fail/cred")
    public String authoncitachonFailCredintal( ) {

        return "login";
    }

    @RequestMapping("/login/fail/dis")
    public String authoncitachonFailDisabled( ) {

        return "vertification";
    }


    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }


    @RequestMapping("/virfication/{uuid}/{userName}")
    public String verfication(@PathVariable String uuid, @PathVariable String userName, HttpSession session) {
        User user = userDAO.getUserBuUserName(userName);
        if (user.getActivation().getactivationCode().equals(uuid)) {
            user.setEnabled(true);
            userDAO.updateProfile(user);
            session.setAttribute("user", user);
            return "index";
        } else {
            return "404";
        }
    }


}
