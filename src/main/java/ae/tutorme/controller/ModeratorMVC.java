package ae.tutorme.controller;

import ae.tutorme.dao.CourseDAO;
import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.Course;
import ae.tutorme.model.Moderator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;

/**
 * Created by almehairbi on 5/1/17.
 */

@Controller
@RequestMapping("/moderator")
public class ModeratorMVC {


    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private UserDAO userDAO;


    @RequestMapping("/home")
    public String moderatorHome(Model model) {
        List<Course> courses = courseDAO.getCourses();
        model.addAttribute("indexCourses", courses);
        return "moderatorDashBoard";
    }

    @RequestMapping("/course/enable/{courseId}")
    public String acceptCourse(@PathVariable("courseId")int courseId, Model model, Principal principal) {

        Course course = courseDAO.getCourseById(courseId);

        if (course == null || course.isEnabled()) {
            model.addAttribute("message", "Either the course is not there or it is already enabled. please contact your administrator for further information.");
            return "moderatorDashBoard";
        }

        course.setEnabled(true);
        Moderator moderator = (Moderator) userDAO.getUserBuUserName(principal.getName());
        course.setModerator(moderator);
        moderator.getCourses().add(course);
        userDAO.updateProfile(moderator);
        courseDAO.updateCourse(course);
        model.addAttribute("message", "Course number: " + courseId + ", have been enabled.");
        List<Course> courses = courseDAO.getCourses();
        model.addAttribute("indexCourses",courses);

        return "moderatorDashBoard";

    }

    @RequestMapping("/course/disable/{courseId}")
    public String disableCourse(@PathVariable("courseId")int courseId, Model model, Principal principal) {

        Course course = courseDAO.getCourseById(courseId);

        if (course == null || !course.isEnabled()) {
            model.addAttribute("message", "Either the course is not there or it is already disabled. please contact your administrator for further information.");
            return "moderatorDashBoard";
        }

        course.setEnabled(false);
        Moderator moderator = (Moderator) userDAO.getUserBuUserName(principal.getName());
        moderator.getCourses().add(course);
        course.setModerator(moderator);
        userDAO.updateProfile(moderator);
        courseDAO.updateCourse(course);
        model.addAttribute("message", "Course number: " + courseId + ", have been enabled.");
        List<Course> courses = courseDAO.getCourses();
        model.addAttribute("indexCourses",courses);

        return "moderatorDashBoard";

    }



}
