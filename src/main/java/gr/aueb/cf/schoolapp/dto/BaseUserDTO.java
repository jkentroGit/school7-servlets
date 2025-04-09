package gr.aueb.cf.schoolapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public abstract class BaseUserDTO {
    private String username;
    private String password;
    private String confirmedPassword;




    public BaseUserDTO(String username, String password) {
        this.username = username;
        this.password = password;
    }

//    public BaseUserDTO(String username, String password, String confirmedPassword) {
//        this.username = username;
//        this.password = password;
//        this.confirmedPassword = confirmedPassword;
//    }

//    public String getUsername() {
//        return username;
//    }
//
//    public void setUsername(String username) {
//        this.username = username;
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//
//    public String getConfirmedPassword() {
//        return confirmedPassword;
//    }
//
//    public void setConfirmedPassword(String confirmedPassword) {
//        this.confirmedPassword = confirmedPassword;
//    }
}
