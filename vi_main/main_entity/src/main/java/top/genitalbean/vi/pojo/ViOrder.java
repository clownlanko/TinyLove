package top.genitalbean.vi.pojo;


public class ViOrder {

  private String ordreId;
  private String userId;
  private String goodsId;
  private java.util.Date createTime;
  private java.util.Date modifyTime;
  private java.lang.Integer status;


  public String getOrdreId() {
    return ordreId;
  }

  public void setOrdreId(String ordreId) {
    this.ordreId = ordreId;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public String getGoodsId() {
    return goodsId;
  }

  public void setGoodsId(String goodsId) {
    this.goodsId = goodsId;
  }


  public java.util.Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.util.Date createTime) {
    this.createTime = createTime;
  }


  public java.util.Date getModifyTime() {
    return modifyTime;
  }

  public void setModifyTime(java.util.Date modifyTime) {
    this.modifyTime = modifyTime;
  }


  public java.lang.Integer getStatus() {
    return status;
  }

  public void setStatus(java.lang.Integer status) {
    this.status = status;
  }

}
