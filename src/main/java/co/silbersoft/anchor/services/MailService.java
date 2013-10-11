package co.silbersoft.anchor.services;

import co.silbersoft.anchor.dao.MailSettingsDao;
import co.silbersoft.anchor.models.MailSettings;
import java.util.Properties;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class MailService {

    @Transactional
    public void sendMessage(String from, String message) throws MailException {        
        final MailSettings mailSettings = mailSettingsDao.getSettings();
        if (mailSettings == null) {            
            throw new RuntimeException("Unable to detect mail settings");
        } else {
            log.debug(String.valueOf(mailSettings.getUsername()));
            Properties props = new Properties();
            props.put("mail.smtp.auth", (mailSettings.isSmtpAuth()) ? "true" : "false");
            props.put("mail.smtp.starttls.enable",mailSettings.isStarttls() ? "true" : "false");
            props.put("mail.smtp.host", mailSettings.getSmtpHost());
            props.put("mail.smtp.port", mailSettings.getSmtpPort());

            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(mailSettings.getUsername(), mailSettings.getPassword());
                }
            });         
            mailSender.setSession(session);
        }
        mailMessage.setFrom(mailSettings.getFromAddress());
        mailMessage.setSubject(mailSettings.getSubject());
        SimpleMailMessage msg = new SimpleMailMessage(mailMessage);
        msg.setTo(mailSettings.getToAddress());
        msg.setText(
                "You've received a message from " + from + " with the following content: \n\n" + message);
        this.mailSender.send(msg);
    }

    @Transactional(readOnly = false)
    public void updateMailSettings(MailSettings m) {
        if (m.getId() == null) {
            mailSettingsDao.create(m);
        } else {
            mailSettingsDao.update(m);
        }
    }

    @Transactional
    public MailSettings getMailSettings() {
        return mailSettingsDao.getSettings();
    }
    
    
    private Logger log = LoggerFactory.getLogger(MailService.class);
    @Autowired
    SimpleMailMessage mailMessage;
    @Autowired
    JavaMailSenderImpl mailSender;
    @Autowired
    MailSettingsDao mailSettingsDao;
}
