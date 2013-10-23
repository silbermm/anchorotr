
package co.silbersoft.anchor.test;

import co.silbersoft.anchor.config.AppContext;
import co.silbersoft.anchor.config.WebConfig;
import co.silbersoft.anchor.services.MailService;
import org.apache.log4j.Logger;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.junit.Test;
import org.springframework.mail.MailException;
import org.junit.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {WebConfig.class, AppContext.class})


public class TestMailSender {
    
     private static final Logger log = Logger.getLogger(TestMailSender.class);
     
     @Test
     public void testSendMail(){
         try {
            log.info("Trying to send mail message...");
            mailService.sendMessage("silbermm@gmail.com", "Testing");
         } catch(MailException e){
             Assert.fail();
         }
         Assert.assertTrue(true);         
     }
     
     @Autowired MailService mailService;
    
}
