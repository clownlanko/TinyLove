package top.genitalbean.vi.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class UserEntity {
    private String userId;
    private String userName;
    private String password;
    private Date createTime;
    private String idCard;
    private String phone;
    private String email;
    private String headPhoto;
    private Date modifyTime;
}
