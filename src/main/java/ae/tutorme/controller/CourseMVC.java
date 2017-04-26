package ae.tutorme.controller;

import ae.tutorme.dao.CourseDAO;
import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.Course;
import ae.tutorme.model.Instructor;
import ae.tutorme.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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
import java.util.logging.Logger;

/**
 * Created by almehairbi on 2/28/17.
 */


//@Secured({"ADMIN","INSTRUCTOR"})
@Controller
@RequestMapping(value = "/course")
public class CourseMVC {

//    private static final Logger logger = Logger.getLogger(CourseMVC.class);

    private Path path;

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(method = RequestMethod.POST, value = "/savecourse")
    public String saveCourse(@ModelAttribute("Course") Course course, BindingResult result, HttpServletRequest request, HttpSession session) {

        if(result.hasErrors())
        {
            return "redirect:/addCourse";
        }

        Instructor i = (Instructor) session.getAttribute("user");

        if(i == null)
        {
            return "404";
        }


        course.setInstructor(i);
        i.getCourses().add(course);

        userDAO.updateProfile(i);

        MultipartFile courseImage = course.getCourseImage();

        // Making file path
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/instructor/"+ i.getUserId()+"/"+
                "courses/"+ course.getCourseId() +"/" + course.getCourseId()+"." + "png");
        // creating the directories
        File file = new File(path.toString());
        if (!file.exists()) {
            if (file.mkdirs()) {
                System.out.println("file :" + file.toString() +" created");
            }else
            {
                System.out.println("File didn't created");
            }

        }
        // adding the image to the directory
        if(courseImage != null && !courseImage.isEmpty())
        {
            try
            {
                courseImage.transferTo(file);

            } catch (Exception e)
            {
                e.printStackTrace();
                throw new RuntimeException("Course image saving failed.", e);
            }
        }
        return "redirect:/home";
    }

    @RequestMapping("/addCourse")
    public String createCourse() {
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

