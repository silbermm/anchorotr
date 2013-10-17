package co.silbersoft.anchor.forms;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.validator.constraints.ScriptAssert;

@ScriptAssert(
        lang = "javascript",
        script = "_this.confirmPassword.equals(_this.password)",
        message = "account.password.mismatch.message")
public class AccountForm {

    private String password, confirmPassword;
    
    @NotNull
    @Size(min = 6, max = 50)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @NotNull
    @Size(min = 6, max = 50)
    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}
