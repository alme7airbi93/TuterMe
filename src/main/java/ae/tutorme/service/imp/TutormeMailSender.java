package ae.tutorme.service.imp;

import ae.tutorme.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

/**
 * Created by almehairbi on 3/18/17.
 */

@Service
public class TutormeMailSender {

    @Autowired
    private MailSender mailSender;

    // for sending simple mails

    public void sendMail(String toAddress, String fromAddress, String subject, String msgBody) {

        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(fromAddress);
        simpleMailMessage.setTo(toAddress);
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setText(msgBody);
        mailSender.send(simpleMailMessage);
    }

    public void sendVirfication(User user) {

        String link = "www.tutorme.ae/virfication/" + user.getActivation().getactivationCode();
        sendMail(user.getUserName(),"admin@tutorme.ae","Tutorme-Virfication",link);
    }


}
