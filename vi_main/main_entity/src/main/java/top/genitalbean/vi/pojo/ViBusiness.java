package top.genitalbean.vi.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter@Setter@ToString
public class ViBusiness {
    private String businessId;
    private String userId;
    private String autograph;
    private Integer creditLevel;
    private Integer likeQuantity;
    private Integer lookQuantity;
    private Date createTime;
    private Date modifyTime;
}
