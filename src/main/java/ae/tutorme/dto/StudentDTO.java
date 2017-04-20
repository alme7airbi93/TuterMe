package ae.tutorme.dto;


import ae.tutorme.model.Enrollment;
import ae.tutorme.model.Student;
import ae.tutorme.model.User;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by almehairbi on 2/17/17.
 */


public class StudentDTO extends UserDTO
{

    private Set<EnrollmentDTO> enrollmentDTOs = new HashSet<>();

    private Set<RateDTO> rates = new HashSet<>();

    public StudentDTO(User user) {
        super(user);
        this.enrollmentDTOs = enrollmentConverter(((Student) user).getEnrollments());
    }
    
    public StudentDTO() {
		// TODO Auto-generated constructor stub
	}

    public Set<EnrollmentDTO> enrollmentConverter(Set<Enrollment> enrollments) {
        Set<EnrollmentDTO> enrollmentDTOs = new HashSet<>(enrollments.size());
        for (Enrollment e : enrollments) {
            EnrollmentDTO enrollmentDTO = new EnrollmentDTO(e);
            enrollmentDTOs.add(enrollmentDTO);
        }
        return enrollmentDTOs;
    }
    public Set<EnrollmentDTO> getEnrollmentDTOs() {
        return enrollmentDTOs;
    }

    public void setEnrollmentDTOs(Set<EnrollmentDTO> enrollmentDTOs) {
        this.enrollmentDTOs = enrollmentDTOs;
    }

    public Set<RateDTO> getRates() {
        return rates;
    }

    public void setRates(Set<RateDTO> rates) {
        this.rates = rates;
    }


}
