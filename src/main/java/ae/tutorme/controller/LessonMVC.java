package ae.tutorme.controller;

import ae.tutorme.dao.CourseDAO;
import ae.tutorme.dao.TopicDAO;
import ae.tutorme.dao.UserDAO;
import ae.tutorme.model.Course;
import ae.tutorme.model.Instructor;
import ae.tutorme.model.Lesson;
import ae.tutorme.model.Topic;
import org.hibernate.annotations.SourceType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import java.security.Principal;

/**
 * Created by almehairbi on 4/26/17.
 */
@Controller
@RequestMapping("/lesson")
public class LessonMVC {

    private Path path;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private TopicDAO topicDAO;

    @Autowired
    private CourseDAO courseDAO;

    @RequestMapping(value = "/add/{courseId}/{topicId}",method = RequestMethod.GET)
    public String createTopic(@PathVariable("topicId")int topicId, @PathVariable("courseId") int courseId,
                              @ModelAttribute("Lesson")Lesson lesson, HttpServletRequest request, Principal principal)
    {
        Instructor instructor = (Instructor) userDAO.getUserBuUserName(principal.getName());
        Course course = courseDAO.getCourseById(courseId);
        Topic topic = topicDAO.getById(topicId);
        if (course == null || topic == null) {
            return "404";
        }
        for (Course c : instructor.getCourses()) {
            if (c.getCourseId() == courseId) {
                request.setAttribute("course",course);
                request.setAttribute("topic",topic);
                return "addlesson";
            }
        }

        return "404";

    }

    @RequestMapping(value = "/add/{courseId}/{topicId}",method = RequestMethod.POST)
    public String addLesson(@PathVariable("topicId")int topicId,@PathVariable("courseId") int courseId,
                           @ModelAttribute("lesson")Lesson lesson, HttpServletRequest request,Principal principal ) {

        Instructor instructor = (Instructor) userDAO.getUserBuUserName(principal.getName());
        Course course = courseDAO.getCourseById(courseId);
        Topic topic = topicDAO.getById(topicId);
        boolean matchCourse = false;
        boolean matchUser = false;
        if (topic == null || course == null ) {
            return "404";
        }
        for (Topic t : course.getTopics()) {
            if (t.getId() == topicId) {
                matchCourse = true;
            }
        }
        for (Course c : instructor.getCourses()) {
            if (c.getCourseId() == courseId) {
                matchUser = true;
            }
        }
        if (!matchCourse && !matchUser) {
            return "404";
        }


        MultipartFile lessonImage = lesson.getPicture();
        MultipartFile vid = lesson.getVideo();


        lesson.setTopic(topic);
        topic.getLessons().add(lesson);

        topicDAO.updateTopic(topic);

        String matiralPath = lesson.getId() + "."+ vid.getContentType().toString().substring(vid.getContentType().toString().lastIndexOf('/') + 1);
        lesson.setMaterialPath(matiralPath);

        topicDAO.updateTopic(topic);

        // Making file path for image
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/instructor/"+ course.getInstructor().getUserId()+"/"+
                "courses/"+ course.getCourseId() +"/topics/" + topicId + "/" + lesson.getId() +"." + "png");

        // making file path for vid
        File vidFile = new File("/tmp/secure/hls/"+lesson.getMaterialPath());
        if (!vidFile.exists()) {
            if (vidFile.mkdirs()) {
                System.out.println("Video path made !");
            }
        }
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
        if(lessonImage != null && !lessonImage.isEmpty() && vid != null && !vid.isEmpty())
        {
            try
            {
                lessonImage.transferTo(file);
                vid.transferTo(vidFile);

            } catch (Exception e)
            {
                e.printStackTrace();
                throw new RuntimeException("Lesson image saving failed.", e);
            }
        }

        return "redirect:/course/updateCourse/" + courseId;
    }

}
