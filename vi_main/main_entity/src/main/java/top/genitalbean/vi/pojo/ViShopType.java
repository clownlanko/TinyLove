package top.genitalbean.vi.pojo;


import java.util.List;

public class ViShopType {

  private java.lang.Integer typeId;
  private String typeName;
  private java.lang.Integer parentId;
  private String remark;
  private List<ViShopType> children;

  public List<ViShopType> getChildren() {
    return children;
  }

  public void setChildren(List<ViShopType> children) {
    this.children = children;
  }

  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public java.lang.Integer getTypeId() {
    return typeId;
  }

  public void setTypeId(java.lang.Integer typeId) {
    this.typeId = typeId;
  }


  public String getTypeName() {
    return typeName;
  }

  public void setTypeName(String typeName) {
    this.typeName = typeName;
  }


  public java.lang.Integer getParentId() {
    return parentId;
  }

  public void setParentId(java.lang.Integer parentId) {
    this.parentId = parentId;
  }

  @Override
  public String toString() {
    return "ViShopType{" +
            "typeId=" + typeId +
            ", typeName='" + typeName + '\'' +
            ", parentId=" + parentId +
            ", remark='" + remark + '\'' +
            ", children=" + children +
            '}';
  }
}
