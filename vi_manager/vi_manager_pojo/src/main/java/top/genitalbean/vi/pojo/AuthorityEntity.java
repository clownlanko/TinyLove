package top.genitalbean.vi.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AuthorityEntity {
    private Integer authorityId;
    private String authorityName;
    private String authorityRemark;
    private Integer patentId;
    private Integer quantity;
}
