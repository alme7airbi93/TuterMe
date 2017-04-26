package ae.tutorme.controller;

import ae.tutorme.dao.CourseDAO;
import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.Course;
import ae.tutorme.model.Instructor;
import ae.tutorme.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by almehairbi on 2/28/17.
 */

@Controller
@RequestMapping(value = "/instructor/course")
public class CourseMVC {


    private Path path;

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(method = RequestMethod.POST, value = "/savecourse")
    public String saveCourse(@ModelAttribute("course") Course course, BindingResult result, HttpServletRequest request, HttpSession session) {

        Instructor i = (Instructor) session.getAttribute("user");

        if(i == null)
        {
            return "404";
        }


        course.setInstructor(i);
        i.getCourses().add(course);

        userDAO.updateProfile(i);

        courseDAO.saveCourse(course);

        MultipartFile courseImage = course.getCourseImage();

        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + course.getCourseId() + ".png");

        if(courseImage != null && !courseImage.isEmpty())
        {
            try
            {
                courseImage.transferTo(new File(path.toString()));

            } catch (Exception e)
            {
                e.printStackTrace();
                throw new RuntimeException("Course image saving failed.", e);
            }
        }
        return "/editcourse";
    }

    @RequestMapping("/createcourse")
    public String createCourse(Model model) {

        Course course = new Course();
        model.addAttribute("savecourse",course);
        return "createcourse";
    }


    @RequestMapping(method = RequestMethod.GET, value = "/{courseId}")
    public String getCourseById(@PathVariable int courseId, Model model) {

        Course course = courseDAO.getCourseById(courseId);
        model.addAttribute("course", course);
        return "";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/instructor/{instructorId}")
    public String getCourseByInstructorId(@PathVariable int instructorId, Model model) {
        List<Course> courses = courseDAO.getCourseByTeacherId(instructorId);
        model.addAttribute("instructorCourses", courses);
        return "";
    }

    @RequestMapping(method = RequestMethod.PUT)
    public String updateCourse(@ModelAttribute("course") Course course) {
        courseDAO.updateCourse(course);
        return "";
    }
}

