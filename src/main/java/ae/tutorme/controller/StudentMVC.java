package ae.tutorme.controller;

import ae.tutorme.dao.CourseDAO;
import ae.tutorme.dao.StudentDAO;
import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.*;
import ae.tutorme.utils.HashMD5;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;

/**
 * Created by almehairbi on 2/28/17.
 */
@Controller
@RequestMapping("/student")
public class StudentMVC {


    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private UserDAO userDAO;


    @RequestMapping("/home")
    public String studentHome(Model model) {
        List<Course> courses = courseDAO.getCourses();
        model.addAttribute("courses", courses);
        return "courses";
    }

    @RequestMapping("/courseDetails/{courseId}")
    public String getCourseDetail(@PathVariable("courseId") int courseId, Model model) {

        Course course = courseDAO.getCourseById(courseId);

        model.addAttribute("course", course);

        return "coursedetailsStudent";
    }

    @RequestMapping("/mycourses")
    public String getMyCourses(Principal principal,HttpSession session) {
        Student student = (Student) userDAO.getUserBuUserName(principal.getName());
        session.setAttribute("user",student);
        return "studentDashBoard";
    }

    @RequestMapping("/enrolled/course/{courseId}")
    public String getMyCourseLessons(Model model,HttpSession session,@PathVariable("courseId")int courseId) {
        Student student = (Student) session.getAttribute("user");
        for (Enrollment enrollment : student.getEnrollments()) {
            if (enrollment.getCourse().getCourseId() == courseId) {
                model.addAttribute("course", enrollment.getCourse());
                return "lesson";
            }
        }

        return "404";
    }

    @RequestMapping("/course/{courseId}/topic/{topicId}/lesson/{lessonId}")
    public String getLessonVid(Model model,@PathVariable("courseId")int courseId,@PathVariable("topicId")int topicId
                            ,@PathVariable("lessonId")int lessonId,Principal principal) {
        Student student = (Student) userDAO.getUserBuUserName(principal.getName());
        for (Enrollment enrollment : student.getEnrollments()) {
            if (enrollment.getCourse().getCourseId() == courseId) {
                for (Topic topic : enrollment.getCourse().getTopics()) {
                    if (topic.getId() == topicId) {
                        for (Lesson lesson : topic.getLessons()) {
                            if (lesson.getId() == lessonId) {
                                model.addAttribute("course", enrollment.getCourse());
                                model.addAttribute("lesson", lesson);
                                model.addAttribute("url", HashMD5.getHashPath(lesson.getMaterialPath()));
                                return "videoplayer";
                            }
                        }
                    }
                }

            }
        }
        return "404";
    }





}


