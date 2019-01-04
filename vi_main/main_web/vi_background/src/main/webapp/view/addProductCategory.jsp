<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="author" content="lanko"/>
    <meta name="keywords" content="微爱，婚纱"/>
    <meta name="description" content="再微小的爱也应该得到敬重。"/>
    <link rel="shortcut icon" type="image/x-icon" href="/TinyLove/vib/images/vi.png"/>
    <title>微·爱</title>
    <link href="/TinyLove/vib/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/TinyLove/vib/css/style.css" />
    <link rel="stylesheet" href="/TinyLove/vib/assets/css/ace.min.css" />
    <link rel="stylesheet" href="/TinyLove/vib/assets/css/font-awesome.min.css" />
    <link href="/TinyLove/vib/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="type_style">
    <div class="type_title">产品类型信息</div>
    <div class="type_content">

        <div class="Operate_btn">
            <form class="form form-horizontal" id="form-user-add">
                <div class="Operate_cont clearfix">
                    <label class="form-label"><span class="c-red">*</span>分类名称：</label>
                    <div class="formControls ">
                        <input style="margin-left: 10px;width: 380px;" type="text" class="input-text" value="" placeholder="" id="typeName" name="typeName">
                    </div>
                </div>
                <div class="Operate_cont clearfix">
                    <label class="form-label">备注：</label>
                    <div class="formControls">
									<textarea name="remark" class="textarea" placeholder="说点什么..."  dragonfly="true" style="width: 380px;"
                                              onKeyUp="textarealength(this,100)"></textarea>
                        <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
                    </div>
                </div>
            </form>
            <a href="javascript:addShopType('${param.parentId}')" class="btn  btn-warning"><i class="icon-edit align-top bigger-125"></i>新增</a>
            <a href="javascript:void(0)" class="btn  btn-danger"><i class="icon-trash   align-top bigger-125"></i>删除</a>
        </div>
    </div>
</div>
</div>
<script src="/TinyLove/vib/js/jquery.min.js"></script>
<script src="/TinyLove/vib/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/TinyLove/vib/Widget/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="/TinyLove/vib/Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="/TinyLove/vib/assets/layer/layer.js"></script>
<script type="text/javascript" src="/TinyLove/vib/js/H-ui.js"></script>
<script type="text/javascript" src="/TinyLove/vib/js/H-ui.admin.js"></script>
<script src="/TinyLove/vib/layui/layui.js"></script>
<script type="text/javascript" src="/TinyLove/vib/js/addProductCategory.js"></script>
</body>
</html>