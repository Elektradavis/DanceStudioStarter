package com.elektradavis.danceStudioStarter.models;

import javax.validation.constraints.AssertFalse;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
    
public class LoginUser {
	
	@NotEmpty(message="Email is required!")
    @Email(message="Please enter a valid email!")
    private String email;
    
    @NotEmpty(message="Password is required!")
    private String password;
    
    private boolean validPassword;
    
    public LoginUser() {}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean matches(User user) {
		return user.getPassword().equals(password);
	}
	
    @AssertFalse(message="Invalid password!")
    public boolean isValid() {
    	return validPassword;
    }
    
	public void setValidPassword(boolean validPassword) {
		this.validPassword = validPassword;
	}
    
	public void validate(User user) {
		validPassword = matches(user);
	}
    
}
