package top.genitalbean.vi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.genitalbean.vi.commons.exception.DataAreadyExistsException;
import top.genitalbean.vi.commons.web.ResponseResult;
import top.genitalbean.vi.pojo.ViShopType;
import top.genitalbean.vi.service.impl.ShopTypeService;

import java.util.List;

@Controller
@RequestMapping("/stc")
public class ShopTypeController extends BaseController{
    @Autowired private ShopTypeService shopTypeService;
    @ResponseBody@PostMapping("/ast")
    public ResponseResult<Void> addShopType(ViShopType type){
        ResponseResult<Void> result = new ResponseResult<>();
        try {
            if(shopTypeService.insert(type)){
                result.setState(4);
                result.setMessage("添加成功");
            }
        } catch (DataAreadyExistsException e) {
            result.setState(-1);
            result.setMessage(e.getMessage());
        }
        return result;
    }
    @ResponseBody@GetMapping("/sts")
    public ResponseResult<List<ViShopType>> queryShopTypeList(){
        return new ResponseResult<>(4,shopTypeService.query());
    }
}
