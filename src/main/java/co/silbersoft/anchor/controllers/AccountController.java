package co.silbersoft.anchor.controllers;

import co.silbersoft.anchor.forms.AccountForm;
import co.silbersoft.anchor.services.AccountService;
import java.util.HashSet;
import java.util.Set;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/users")
public class AccountController {

    private static final String VN_REG_FORM = "register";
    private static final String VN_REG_OK = "redirect:register_ok";

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setAllowedFields(new String[]{
            "username", "password", "confirmPassword", "firstName",
            "lastName", "email"});
    }
    
    @PreAuthorize("hasRole('Administrator')")
    @RequestMapping(value="adminAccount", method=RequestMethod.GET)
    public String createAdminAccount(){
        accountService.registerUser("admin", "@nchor0tr", "administrator");
        return "index";
    }

    @RequestMapping(value = "new", method = RequestMethod.GET)
    public String getRegistrationForm(Model model) {
        model.addAttribute("account", new AccountForm());
        return "register";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String postRegistrationForm(@ModelAttribute("account") @Valid AccountForm form, BindingResult result) {
        convertPasswordError(result);
        accountService.registerAccount(
                toUser(form), form.getPassword(), result);
        return (result.hasErrors() ? VN_REG_FORM : VN_REG_OK);
    }

    private static User toUser(AccountForm form) {
        Set<GrantedAuthority> s = new HashSet();
        s.add(new SimpleGrantedAuthority("user"));
        User u = new User(form.getUsername(), form.getPassword(), s);
        return u;
    }

    private static void convertPasswordError(BindingResult result) {
        for (ObjectError error : result.getGlobalErrors()) {
            String msg = error.getDefaultMessage();
            if ("account.password.mismatch.message".equals(msg)) {
                if (!result.hasFieldErrors("password")) {
                    result.rejectValue("password", "error.mismatch");
                }
            }
        }
    }
    
    @Autowired
    AccountService accountService;
}
