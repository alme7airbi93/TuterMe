package ae.tutorme.controller;

import ae.tutorme.dao.CourseDAO;
import ae.tutorme.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by almehairbi on 5/2/17.
 */

@Controller
public class SearchMVC {

    @Autowired
    private CourseDAO courseDAO;

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public String seachBox(HttpServletRequest request, @RequestParam("search")String keyward) {

        if (keyward.equals("") || keyward == null) {
            return "redirect:/";
        }

        List<Course> courseList = courseDAO.getCourses();
        ArrayList<Course> courses = new ArrayList<>();
        for (Course course : courseList) {
            if (course.getName().contains(keyward) || course.getDescription().contains(keyward) ) {
                if (course.getCategory() != null) {
                    if(course.getCategory().getName().contains(keyward))
                    {
                        courses.add(course);
                    }
                }else
                {
                    courses.add(course);

                }

            }
        }

        request.setAttribute("searchCourses", courses);
        return "search";

    }
}
