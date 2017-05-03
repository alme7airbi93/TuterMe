package ae.tutorme.controller;

import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.User;
import ae.tutorme.service.imp.TutormeMailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

/**
 * Created by almehairbi on 5/3/17.
 */
@Controller
@RequestMapping("/user")
public class UserMVC {


    @Autowired
    private UserDAO userDAO;

    @Autowired
    private TutormeMailSender tutormeMailSender;

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String updateUser(@RequestParam("userName") String userName, @RequestParam("password") String password, Model model, Principal principal) {

        if (userName.equals("") || password.equals("")) {
            model.addAttribute("message","Please be sure about the written information");
            return "updateUser";
        }
            User user = userDAO.getUserBuUserName(principal.getName());

            user.setUserName(userName);
            user.setPassword(password);
            model.addAttribute("message","Your information has been successfully updated.");
            userDAO.updateProfile(user);
            return "updateUser";


    }

    @RequestMapping(value = "/update",method = RequestMethod.GET)
    public String updateUser() {
        return "updateUser";
    }
}
