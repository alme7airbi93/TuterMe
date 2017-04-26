package ae.tutorme.model;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

/**
 * Created by almehairbi on 2/23/17.
 */

@Entity
@Table(name = "LESSON")
public class Lesson {

    @Id
    @GeneratedValue
    @Column(name = "LESSON_ID")
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @PrimaryKeyJoinColumn
    private Topic topic;

    @Column(name = "LESSON_NAME")
    private String lessonName;

    @Column(name = "LESSON_NUMBER")
    private int lessonNumber;

    @Column(name = "MATERIAL_PATH")
    private String materialPath;

    @Transient
    private MultipartFile video;


    @Transient
    private MultipartFile picture;

    public Lesson(int id, Topic topic, String lessonName, int lessonNumber, String materialPath) {
		super();
		this.id = id;
		this.topic = topic;
		this.lessonName = lessonName;
		this.lessonNumber = lessonNumber;
		this.materialPath = materialPath;
	}

	public Lesson() {
        this.lessonName = "";
        this.lessonNumber = 0;
        this.materialPath = "";
        this.topic = null;
    }

    public Lesson(Topic topic) {
        this();
        this.topic = topic;
    }

    public Lesson(Topic topic, String lessonName, int lessonNumber, String materialPath) {
        this.topic = topic;
        this.lessonName = lessonName;
        this.lessonNumber = lessonNumber;
        this.materialPath = materialPath;
    }

    public int getId() {
        return id;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public int getLessonNumber() {
        return lessonNumber;
    }

    public void setLessonNumber(int lessonNumber) {
        this.lessonNumber = lessonNumber;
    }

    public String getMaterialPath() {
        return materialPath;
    }

    public void setMaterialPath(String materialPath) {
        this.materialPath = materialPath;
    }

    public void setId(int id) {
        this.id = id;
    }

    public MultipartFile getVideo() {
        return video;
    }

    public void setVideo(MultipartFile video) {
        this.video = video;
    }

    public MultipartFile getPicture() {
        return picture;
    }

    public void setPicture(MultipartFile picture) {
        this.picture = picture;
    }
}
