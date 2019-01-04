package top.genitalbean.vi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.genitalbean.vi.commons.exception.DataAreadyExistsException;
import top.genitalbean.vi.mapper.impl.ShopTypeMapper;
import top.genitalbean.vi.pojo.ViShopType;
import top.genitalbean.vi.service.BaseService;

import java.util.List;

@Service
public class ShopTypeService implements BaseService {
    @Autowired private ShopTypeMapper shopTypeMapper;
    public ViShopType queryByNameAndParent(String typeName,Integer parentId){
        return shopTypeMapper.queryByNameAndParent(typeName,parentId);
    }
    @Override
    public <T> boolean insert(T t) throws DataAreadyExistsException{
        if(t instanceof ViShopType)
            if(queryByNameAndParent(((ViShopType) t).getTypeName(),((ViShopType) t).getParentId())!=null){
                throw new DataAreadyExistsException(((ViShopType) t).getTypeName()+"已经存在");
            }
        return shopTypeMapper.insert(t)==1;
    }

    @Override
    public <T> boolean delete(T e) {
        return false;
    }

    @Override
    public <T> boolean update(T t) {
        return false;
    }

    @Override
    public <T> List<T> query() {
        return shopTypeMapper.query();
    }
}
