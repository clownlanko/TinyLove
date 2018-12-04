package top.genitalbean.vi.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class JobEntity {
    private Integer jobId;
    private String jobName;
    private String jobRemark;
}
