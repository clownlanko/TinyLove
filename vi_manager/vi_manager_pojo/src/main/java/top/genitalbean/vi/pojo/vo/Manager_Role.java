package top.genitalbean.vi.pojo.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Manager_Role {
	private String userId;
	private String userName;
	private String password;
	private String phone;
	private String email;
	private String jobName;
	private String jobRemark;
	private Double salary;
	private String authorityName;
	private String authorityRemark;
	private Integer status;
}
