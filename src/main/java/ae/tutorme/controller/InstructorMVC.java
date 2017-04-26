package ae.tutorme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by almehairbi on 4/26/17.
 */
@Controller
@RequestMapping("/instructor")
public class InstructorMVC {


    @RequestMapping("/home")
    public String instractorHome() {

        return "instructordashboard";
    }
}
