package ae.tutorme.controller;

import ae.tutorme.dao.CourseDAO;
import ae.tutorme.dao.EnrollmentDAO;
import ae.tutorme.dao.StudentDAO;
import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.Course;
import ae.tutorme.model.Enrollment;
import ae.tutorme.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * Created by almehairbi on 2/28/17.
 */

@Controller
@RequestMapping(value = "/enrollment")
public class EnrollmentMVC {

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(method = RequestMethod.GET, value = "list")
    public String getEnrollments(HttpSession session, Model model) {
        String userName = (String) session.getAttribute("userName");
        Student student = (Student) userDAO.getUserBuUserName(userName);

        Set<Enrollment> enrollments = student.getEnrollments();

        model.addAttribute("enrollments", enrollments);

        return "";


    }

    @RequestMapping("/enroll/{courseId}")
    public String enrollToCourse( Principal principal, @PathVariable("courseId")int courseId,final RedirectAttributes redirectAttributes) {
        Student student = (Student) userDAO.getUserBuUserName(principal.getName());
        Course course = courseDAO.getCourseById(courseId);
        if (course == null || student == null) {
            return "404";
        }
        for (Enrollment e : student.getEnrollments()) {
            if (e.getCourse().getCourseId() == course.getCourseId()) {
                redirectAttributes.addFlashAttribute("message","You already have been registerd in this course before !");
                return "redirect:/student/courseDetails/"+courseId;
            }
        }

        Enrollment enrollment = new Enrollment();
        enrollment.setAmountPaid(course.getPrice());
        enrollment.setEnrolledDate(new Date(System.currentTimeMillis()));
        enrollment.setCourse(course);
        enrollment.setStudent(student);

        student.getEnrollments().add(enrollment);
        userDAO.updateProfile(student);
        redirectAttributes.addFlashAttribute("message","You have successfully enrolled in this course !");
        return "redirect:/student/courseDetails/"+courseId;
    }


}
