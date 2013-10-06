package co.silbersoft.anchor.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailService {

    public void sendMessage(String from, String message) throws MailException {
        SimpleMailMessage msg = new SimpleMailMessage(mailMessage);
        //msg.setTo("info@theanchor-otr.com");
        msg.setTo("silbermm@gmail.com");
        msg.setText(
                "You've received a message from " + from + " with the following content: \n\n" + message);
        this.mailSender.send(msg);
    }
    
    
    private Logger log = LoggerFactory.getLogger(MailService.class);
    @Autowired
    SimpleMailMessage mailMessage;
    @Autowired
    JavaMailSenderImpl mailSender;
}
