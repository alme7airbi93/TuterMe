package ae.tutorme.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.UUID;

/**
 * Created by almehairbi on 2/17/17.
 */

@Entity
@Table(name = "ACTIVATION")
public class Activation
{

    @Id
    @GeneratedValue
    @Column(name = "ID")
    private int id;

    @Column(name = "ACTIVATION_CODE")
    private String activationCode;

    @Column(name = "EXPIRY_DATE")
    private Date expiryDate;

    @OneToOne(fetch = FetchType.EAGER, mappedBy="activation")
    @JsonIgnore
    private User user;



    public Activation(int id, String activationCode, Date expiryDate, User user) {
		super();
		this.id = id;
		this.activationCode = activationCode;
		this.expiryDate = expiryDate;
		this.user = user;
	}

	public Activation(String activationCode, Date expiryDate, User user) {
        this.activationCode = activationCode;
        this.expiryDate = expiryDate;
        this.user = user;
    }

    public Activation(String activationCode, User user) {
        this.activationCode = activationCode;
        this.user = user;
    }

    public Activation() {
        this.expiryDate = new Date();
        this.activationCode = UUID.randomUUID().toString();
        this.user = null;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getactivationCode() {
        return activationCode;
    }

    public void setactivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
