package ae.tutorme.controller;

import ae.tutorme.dao.CourseDAO;
import ae.tutorme.dao.TopicDAO;
import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.Course;
import ae.tutorme.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;


/**
 * Created by almehairbi on 4/26/17.
 */
@Controller
@RequestMapping("/topic")
public class TopicMVC {

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private TopicDAO topicDAO;

    @Autowired
    private UserDAO userDAO;

    @RequestMapping("/add/{courseId}")
    public String addTopic(@PathVariable("courseId")int courseId, @ModelAttribute("Topic")Topic topic, HttpServletRequest request) {


        Course course = courseDAO.getCourseById(courseId);
        if (course == null) {
            return "404";
        }

        course.getTopics().add(topic);
        courseDAO.updateCourse(course);
        request.setAttribute("course",course);
        return "updatecourse";
    }
}
