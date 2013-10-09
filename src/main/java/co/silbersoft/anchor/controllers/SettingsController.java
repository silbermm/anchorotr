package co.silbersoft.anchor.controllers;

import co.silbersoft.anchor.models.MailSettings;
import co.silbersoft.anchor.services.MailService;
import co.silbersoft.anchor.services.MenuService;
import java.util.HashMap;
import java.util.Map;
import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.mail.MailException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
@RequestMapping("/settings")
@PreAuthorize("hasRole('Administrator')")
public class SettingsController {

    @RequestMapping(value="", method=RequestMethod.GET)
    @PreAuthorize("hasRole('Administrator')")
    public String showSettingsForm(Model model){
        MailSettings m = mailService.getMailSettings();
        model.addAttribute("mailSettings", (m == null ? new MailSettings() : m) );  
        return "settings";
    }
    
    @RequestMapping(value="", method=RequestMethod.POST)
    @PreAuthorize("hasRole('Administrator')")
    public String postSettingsForm(@ModelAttribute("mailSettings") @Valid MailSettings form, BindingResult result){        
        if(result.hasErrors()){
            log.error("There are form errors!");            
        } else {
            log.info("no form errors");
            mailService.updateMailSettings(form);
        }
        return "settings";
    }
    
    @ExceptionHandler(MailException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public @ResponseBody Map<String,String> handleMailException(MailException me){
        Map<String, String> error = new HashMap();
        error.put("error", me.getMessage());
        return error;
    }
    
    private Logger log = LoggerFactory.getLogger(SettingsController.class);
    @Autowired MailService mailService;
    
}
