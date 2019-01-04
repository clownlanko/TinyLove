package top.genitalbean.vi.mapper.impl;

import org.apache.ibatis.annotations.Param;
import top.genitalbean.vi.mapper.BaseRepository;
import top.genitalbean.vi.pojo.ViShopType;

public interface ShopTypeMapper extends BaseRepository {
    ViShopType queryByNameAndParent(@Param("typeName")String typeName,@Param("parentId")Integer parentId);
}
