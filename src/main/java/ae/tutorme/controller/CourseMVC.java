package ae.tutorme.controller;

import ae.tutorme.dao.CategoryDAO;
import ae.tutorme.dao.CourseDAO;
import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.Category;
import ae.tutorme.model.Course;
import ae.tutorme.model.Instructor;
import ae.tutorme.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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


@Controller
@RequestMapping(value = "/course")
public class CourseMVC {

    private Path path;

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private UserDAO userDAO;


    @Autowired
    private CategoryDAO categoryDAO;

    @RequestMapping(method = RequestMethod.POST, value = "/savecourse")
    public String saveCourse(@ModelAttribute("Course") Course course, BindingResult result, HttpServletRequest request, HttpSession session) {

        return updateOrSaveCourse(course, result, request, session,false);
    }

    @RequestMapping("/addCourse")
    public String createCourse() {
        return "createcourse";
    }



    @RequestMapping(method = RequestMethod.GET, value = "/updateCourse/{courseId}")
    public String getCourseById(@PathVariable int courseId, HttpServletRequest request,HttpSession session) {
        Course course = courseDAO.getCourseById(courseId);
        Instructor instructor = (Instructor) session.getAttribute("user");
        boolean match = false;
        for (Course c : instructor.getCourses()) {
            if (c.getCourseId() == courseId) {
                match = true;
                break;
            }
        }
        if (course == null || !match) {
            return "404";
        }
        request.setAttribute("course",course);
        return "updatecourse";
    }


    @RequestMapping(method = RequestMethod.POST, value = "/update")
    public String update(@ModelAttribute("course") Course course, BindingResult result, HttpServletRequest request, HttpSession session) {

       return updateOrSaveCourse(course, result, request, session,true);

    }

    private void saveMultipart(MultipartFile multipartFile,File file) throws Exception{
        if(multipartFile != null && !multipartFile.isEmpty())
        {
                multipartFile.transferTo(file);

        }
    }

    public String updateOrSaveCourse(Course course, BindingResult result, HttpServletRequest request, HttpSession session,boolean update) {
        if(result.hasErrors())
        {
            return "redirect:/addCourse";
        }

        Instructor i = (Instructor) session.getAttribute("user");

        if(i == null)
        {
            return "404";
        }
        int catId = 0;
        try {
            catId = Integer.parseInt(request.getParameter("categoryId"));
        } catch (NullPointerException e) {

        } catch (NumberFormatException n) {

        }

        Category category = categoryDAO.getCategoryById(catId);
        if (category == null) {
            return "500";
        }

        course.setCategory(category);
        course.setInstructor(i);
        i.getCourses().add(course);
        if (!update) {
            category.getCourses().add(course);
        }
        for (Course c : category.getCourses()) {
            if (c.getCourseId() == course.getCourseId()) {
                category.getCourses().remove(c);
                category.getCourses().add(course);
                break;
            }
        }
        categoryDAO.updateCategory(category);
        courseDAO.updateCourse(course);

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
        try {
            saveMultipart(courseImage,file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/home";
    }



}

