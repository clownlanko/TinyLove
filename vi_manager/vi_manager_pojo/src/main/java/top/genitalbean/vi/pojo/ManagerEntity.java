package top.genitalbean.vi.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ManagerEntity {
	private String userId;
    private Double salary;
    private Integer jobId;
    private Integer status;
    private String modifyTime;
}
