package ae.tutorme.dto.converter;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ae.tutorme.dao.ActivationDAO;
import ae.tutorme.dao.AuthorizationDAO;
import ae.tutorme.dao.CategoryDAO;
import ae.tutorme.dao.CourseDAO;
import ae.tutorme.dao.InstructorDAO;
import ae.tutorme.dao.MessageDAO;
import ae.tutorme.dao.ModeratorDAO;
import ae.tutorme.dao.ResponseDAO;
import ae.tutorme.dao.StudentDAO;
import ae.tutorme.dao.TopicDAO;
import ae.tutorme.dao.UserDAO;
import ae.tutorme.dto.ActivationDTO;
import ae.tutorme.dto.AdminDTO;
import ae.tutorme.dto.AuthorizationDTO;
import ae.tutorme.dto.CategoryDTO;
import ae.tutorme.dto.CourseDTO;
import ae.tutorme.dto.EnrollmentDTO;
import ae.tutorme.dto.InstructorDTO;
import ae.tutorme.dto.LessonDTO;
import ae.tutorme.dto.MessageDTO;
import ae.tutorme.dto.ModeratorDTO;
import ae.tutorme.dto.RateDTO;
import ae.tutorme.dto.ResponseDTO;
import ae.tutorme.dto.StudentDTO;
import ae.tutorme.dto.TopicDTO;
import ae.tutorme.model.Activation;
import ae.tutorme.model.Admin;
import ae.tutorme.model.Authorization;
import ae.tutorme.model.Category;
import ae.tutorme.model.Course;
import ae.tutorme.model.Enrollment;
import ae.tutorme.model.Instructor;
import ae.tutorme.model.Lesson;
import ae.tutorme.model.Message;
import ae.tutorme.model.Moderator;
import ae.tutorme.model.Rate;
import ae.tutorme.model.Response;
import ae.tutorme.model.Student;
import ae.tutorme.model.Topic;
import ae.tutorme.model.User;

@Component
public class Converter {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private ActivationDAO activationDAO;
	
	@Autowired
	private AuthorizationDAO authorizationDAO;
	
	@Autowired
	private InstructorDAO instructorDAO;
	
	@Autowired
	private ModeratorDAO moderatorDAO;
	
	@Autowired
	private StudentDAO studentDAO;
	
	@Autowired
	private CourseDAO courseDAO;
	
	@Autowired
	private TopicDAO topicDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private MessageDAO messageDAO;
	
	@Autowired
	private ResponseDAO responseDAO;

	private static final Logger LOG = Logger.getLogger(Converter.class);
	
	public Activation toActivation(ActivationDTO dto) {
		User user = userDAO.getUserBuUserName(dto.getUserName());
		return new Activation(dto.getId(), dto.getActivationCode(), dto.getExpiryDate(), user);
	}
	
	public Authorization toAuthorization(AuthorizationDTO auth) {
		User user = userDAO.getUserBuUserName(auth.getUserName());
		return new Authorization(auth.getId(), user, auth.getRole());
	}
	
	public Admin toAdmin(AdminDTO adminDTO) {


		Admin admin = new Admin(adminDTO.getUserId(), adminDTO.getUserName(), adminDTO.getPassword(), adminDTO.isEnabled(), adminDTO.getName(),
				new Activation(), new Authorization(), toMessages(adminDTO.getMessages()));

		if(admin.getActivation().getUser() == null)
			admin.getActivation().setUser(admin);
		if(admin.getAuthorization().getUser() == null)
			admin.getAuthorization().setUser(admin);
		
		return admin;
	}
	
	public Student toStudent(StudentDTO studentDTO) {

		Student student = new Student(studentDTO.getUserId(), studentDTO.getUserName(), studentDTO.getPassword(), studentDTO.isEnabled(), studentDTO.getName(),
				new Activation(), new Authorization(), toMessages(studentDTO.getMessages()), toEnrollments(studentDTO.getEnrollmentDTOs()),
				toRates(studentDTO.getRates()));

		if(student.getActivation().getUser() == null)
			student.getActivation().setUser(student);
		if(student.getAuthorization().getUser() == null)
			student.getAuthorization().setUser(student);
		
		return student;
	}
	
	public Instructor toInstructor(InstructorDTO instructorDTO) {
		
		Set<Course> courses = new HashSet<>(instructorDTO.getCourses().size());
		for(CourseDTO c : instructorDTO.getCourses()) {
			courses.add(toCouse(c));
		}
		
		Instructor instructor = new Instructor(instructorDTO.getUserId(), instructorDTO.getUserName(), instructorDTO.getPassword(), instructorDTO.isEnabled(),
				instructorDTO.getName(), new Activation(), new Authorization(), toMessages(instructorDTO.getMessages()), courses);
		
		if(instructor.getActivation().getUser() == null)
			instructor.getActivation().setUser(instructor);
		if(instructor.getAuthorization().getUser() == null)
			instructor.getAuthorization().setUser(instructor);
		
		return instructor;
	}
	
	public Moderator toModerator(ModeratorDTO moderatorDTO) {
		Set<Course> courses = new HashSet<>(moderatorDTO.getCourses().size());
		for(CourseDTO c : moderatorDTO.getCourses()) {
			courses.add(toCouse(c));
		}
		
		Moderator moderator = new Moderator(moderatorDTO.getUserId(), moderatorDTO.getUserName(), moderatorDTO.getPassword(), moderatorDTO.isEnabled(),
				moderatorDTO.getName(), new Activation(), new Authorization(), toMessages(moderatorDTO.getMessages()), courses);
		
		if(moderator.getActivation().getUser() == null)
			moderator.getActivation().setUser(moderator);
		if(moderator.getAuthorization().getUser() == null)
			moderator.getAuthorization().setUser(moderator);
		
		return moderator;
	}
	
	public Lesson toLesson(LessonDTO dto) {
		Topic topic = topicDAO.getById(dto.getTopicId());
		return new Lesson(dto.getId(), topic, dto.getLessonName(), dto.getLessonNumber(), dto.getMaterialPath());
	}
	
	public Topic toTopic(TopicDTO dto) {
		Course course = courseDAO.getCourseById(dto.getCourseId());
		Set<Lesson> lessons = new HashSet<>(dto.getLessons().size());
		Topic topic = new Topic(dto.getId(), course, dto.getTopicName(), dto.getTopicNumber(), lessons);
		for(LessonDTO l : dto.getLessons()) {
			Lesson full = toLesson(l);
			if(full.getTopic() == null)
				full.setTopic(topic);
			lessons.add(full);
		}
		return 	topic;
	}
	
	public Enrollment toEnrollment(EnrollmentDTO enrollment) {
		Student student = studentDAO.getStudentById(enrollment.getStudentId());
		Course course = courseDAO.getCourseById(enrollment.getCourseId());
		return new Enrollment(enrollment.getId(), student, course, enrollment.getEnrolledDate(), enrollment.getAmountPaid());
	}

	public Set<Enrollment> toEnrollments(Set<EnrollmentDTO> enrollmentDTOs) {
		Set<Enrollment> enrollments = new HashSet<>(enrollmentDTOs.size());

		for (EnrollmentDTO dto : enrollmentDTOs) {
			Enrollment enrollment = toEnrollment(dto);
			enrollments.add(enrollment);
		}
		return enrollments;
	}
	
	public Rate toRate(RateDTO dto) {
		Student student = studentDAO.getStudentById(dto.getStudentId());
		Course course = courseDAO.getCourseById(dto.getCourseId());
		return new Rate(dto.getId(), student, course, dto.getRating());
	}

	public Set<Rate> toRates(Set<RateDTO> rateDTOs)
	{
		Set<Rate> rates = new HashSet<>(rateDTOs.size());

		for (RateDTO dto : rateDTOs) {
			Rate rate = toRate(dto);
			rates.add(rate);
		}
		return rates;
	}
	
	public Course toCouse(CourseDTO course) {
		Instructor instructor = instructorDAO.getUserById(course.getInstructorId());
		Moderator moderator = moderatorDAO.getModeratorById(course.getModeratorId());
		Category category = categoryDAO.getCategoryById(course.getCategoryId());
		
		Set<Enrollment> enrollments = new HashSet<>(course.getEnrollments().size());
		for(EnrollmentDTO e : course.getEnrollments()) {
			enrollments.add(toEnrollment(e));
		}
		
		Set<Topic> topics = new HashSet<>(course.getTopics().size());
		for(TopicDTO t : course.getTopics()) {
			topics.add(toTopic(t));
		}
		
		Set<Rate> rates = new HashSet<>(course.getRates().size());
		for(RateDTO r : course.getRates()) {
			rates.add(toRate(r));
		}
		
		return new Course(
				course.getCategoryId(),
				instructor,
				moderator,
				course.getDescription(),
				course.getPrice(),
				course.getName(),
				course.isEnabled(),
				course.getRating(), 
				enrollments, 
				topics, 
				rates, 
				category);
	}
	
	public Category toCategory(CategoryDTO cat) {
		Set<Course> courses = new HashSet<>(cat.getCourses().size());
		for(CourseDTO c : cat.getCourses()) {
			courses.add(toCouse(c));
		}
		return new Category(cat.getCategoryId(), cat.getName(), courses);
	}
	
	public Set<Message> toMessages(Set<MessageDTO> messageDTOs) {
        Set<Message> messages = new HashSet<>();
        for (MessageDTO m : messageDTOs) {
        	messages.add(toMessage(m));
        }
        return messages;
    }


	public Message toMessage(MessageDTO dto) {
		User user = userDAO.getUserById(dto.getUserId());
		Message msg = messageDAO.getMessagesById(dto.getMessageId());
		Set<Message> msgs = new HashSet<>(dto.getMessages().size());
		Message message = new Message(dto.getId(), user, msgs, msg, dto.getReciverId(), dto.getSubject(), dto.getBody());
		
		for(MessageDTO m : dto.getMessages()) {
			Message message1 = toMessage(m);
			message1.setMessage(message);
			msgs.add(message1);
		}
		
		return message;
	}


	
	public Response toResponse(ResponseDTO dto) {
		Course course = courseDAO.getCourseById(dto.getCourseId());
		User user = userDAO.getUserById(dto.getUserId());
		Response response = responseDAO.getById(dto.getResponseId());
		
		Set<Response> res = new HashSet<>(dto.getResponses().size());
		for(ResponseDTO r : dto.getResponses()) {
			res.add(toResponse(r));
		}
		
		return new Response(dto.getId(), course, user, res, response, dto.getText());
	}
}
