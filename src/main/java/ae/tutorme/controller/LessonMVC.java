package ae.tutorme.controller;

import ae.tutorme.dao.CourseDAO;
import ae.tutorme.dao.TopicDAO;
import ae.tutorme.model.Course;
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
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Created by almehairbi on 4/26/17.
 */
@Controller
@RequestMapping("/lesson")
public class LessonMVC {

    private Path path;

    @Autowired
    private TopicDAO topicDAO;

    @Autowired
    private CourseDAO courseDAO;

    @RequestMapping(value = "/lesson/add/{courseId}/{topicId}",method = RequestMethod.GET)
    public String createTopic(@PathVariable("topicId")int topicId,@PathVariable("courseId") int courseId,
                           @ModelAttribute("Lesson")Lesson lesson, HttpServletRequest request )
    {
        Course course = courseDAO.getCourseById(courseId);
        Topic topic = topicDAO.getById(topicId);
        if (course == null || topic == null) {
            return "404";
        }

        request.setAttribute("course",course);
        request.setAttribute("topic",topic);
        return "addlesson";
    }

    @RequestMapping(value = "/lesson/add/{courseId}/{topicId}",method = RequestMethod.POST)
    public String addTopic(@PathVariable("topicId")int topicId,@PathVariable("courseId") int courseId,
                           @ModelAttribute("Lesson")Lesson lesson, HttpServletRequest request ) {

        Course course = courseDAO.getCourseById(courseId);
        Topic topic = topicDAO.getById(topicId);
        boolean match = false;
        for (Topic t : course.getTopics()) {
            if (t.getId() == topicId) {
                match = true;
            }
        }
        if (topic == null || course == null || !match) {
            return "404";
        }


        MultipartFile lessonImage = lesson.getPicture();
        MultipartFile vid = lesson.getVideo();
        lesson.setMaterialPath(lesson.getId() + vid.getContentType());

        topic.getLessons().add(lesson);


        // Making file path for image
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/instructor/"+ course.getInstructor().getUserId()+"/"+
                "courses/"+ course.getCourseId() +"/topics/" + topicId + "/" + lesson.getId() +"." + "png");

        // making file path for vid
        File vidFile = new File("/tmp/hls/"+lesson.getMaterialPath());
        if (!vidFile.exists()) {
            if (vidFile.mkdir()) {
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



        topicDAO.updateTopic(topic);

        return "redirect:/updateCourse/" + courseId;
    }

}
