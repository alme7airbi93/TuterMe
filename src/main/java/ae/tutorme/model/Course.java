package ae.tutorme.model;

import org.hibernate.annotations.Formula;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by almehairbi on 2/18/17.
 */

@Entity
@Table(name = "COURSE")
public class Course {

    @Id
    @GeneratedValue
    @Column(name = "COURSE_ID")
    private int courseId;

    @ManyToOne(fetch = FetchType.EAGER)
    @PrimaryKeyJoinColumn
    private Instructor instructor;

    @ManyToOne(fetch = FetchType.EAGER)
    @PrimaryKeyJoinColumn
    private Moderator moderator;

    @Column(name = "DESCRIPTION")
    private String description;

    @Column(name = "PRICE")
    private double price;

    @Column(name = "NAME")
    private String name;

    @Column(name = "ENABLED")
    private boolean enabled;

    @Transient
    private MultipartFile courseImage;

    @Formula("(select IFNULL(sum(rate.RATING) / count(*), 0) from RATE rate where rate.course_COURSE_ID = COURSE_ID)")
    private double rating;

    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy = "course")
    private Set<Enrollment> enrollments = new HashSet<>(0);

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,mappedBy = "course")
    private Set<Topic> topics = new HashSet<>(0);

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,mappedBy = "course")
    private Set<Rate> rates = new HashSet<>(0);

    @ManyToOne(fetch = FetchType.EAGER)
    @PrimaryKeyJoinColumn(name = "CATEGORY_ID")
    private Category category;



    public Course() {
        this.description = "";
        this.category = null;
        this.instructor = null;
        this.moderator = null;
        this.name = "";
        this.price = 0;
        this.rating = 0;
        this.enabled = false;

    }
    
    public Course(int courseId, Instructor instructor, Moderator moderator, String description, double price, String name, boolean enabled, double rating, Set<Enrollment> enrollments, Set<Topic> topics, Set<Rate> rates, Category category) {
		super();
		this.courseId = courseId;
		this.instructor = instructor;
		this.moderator = moderator;
		this.description = description;
		this.price = price;
		this.name = name;
		this.enabled = enabled;
		this.rating = rating;
		this.enrollments = enrollments;
		this.topics = topics;
		this.rates = rates;
		this.category = category;
	}

	public Course(String name) {
        this();
        this.name = name;
    }

    public Course(Instructor instructor, String name) {
        this(name);
        this.instructor = instructor;
    }

    public Course(Instructor instructor, String name, Category category) {
        this(instructor, name);
        this.category = category;
    }

    public Course(Instructor instructor, Moderator moderator, String description, double price, String name, double rating, Category category) {
        this(instructor, name, category);
        this.moderator = moderator;
        this.description = description;
        this.price = price;
        this.rating = rating;
    }



    public Moderator getModerator() {
        return moderator;
    }

    public void setModerator(Moderator moderator) {
        this.moderator = moderator;
    }

    public Set<Topic> getTopics() {
        return topics;
    }

    public void setTopics(Set<Topic> topics) {
        this.topics = topics;
    }

    public Set<Enrollment> getEnrollments() {
        return enrollments;
    }

    public void setEnrollments(Set<Enrollment> enrollments) {
        this.enrollments = enrollments;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Set<Rate> getRates() {
        return rates;
    }

    public void setRates(Set<Rate> rates) {
        this.rates = rates;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }


    public MultipartFile getCourseImage() {
        return courseImage;
    }

    public void setCourseImage(MultipartFile courseImage) {
        this.courseImage = courseImage;
    }
}
