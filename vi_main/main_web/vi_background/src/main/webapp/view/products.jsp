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
    <link href="/TinyLove/vib/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/TinyLove/vib/css/style.css"/>
    <link rel="stylesheet" href="/TinyLove/vib/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="/TinyLove/vib/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/TinyLove/vib/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link href="/TinyLove/vib/Widget/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <title>微·爱</title>
</head>
<body>
<div class=" page-content clearfix">
    <div id="products_style">
        <div class="search_style">
            <div class="title_names">搜索查询</div>
            <ul class="search_content clearfix">
                <li><label class="l_f">产品名称</label><input name="" type="text" class="text_add" placeholder="输入品牌名称"
                                                          style=" width:250px"/></li>
                <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="start"
                                                          style=" margin-left:10px;"></li>
                <li style="width:90px;">
                    <button type="button" class="btn_search"><i class="icon-search"></i>查询</button>
                </li>
            </ul>
        </div>
        <div class="border clearfix">
					<span class="l_f">
						<a href="/TinyLove/vib/view/addProduct.jsp" title="添加商品" class="btn btn-warning Order_form"><i
                                class="icon-plus"></i>添加商品</a>
						<a href="javascript:ovid()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
					</span>
            <span class="r_f">共：<b>2334</b>件商品</span>
        </div>
        <!--产品列表展示-->
        <div class="h_products_list clearfix" id="products_list">
            <div id="scrollsidebar" class="left_Treeview">
                <div class="show_btn" id="rightArrow"><span></span></div>
                <div class="widget-box side_content">
                    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                    <div class="side_list">
                        <div class="widget-header header-color-green2">
                            <h4 class="lighter smaller">产品类型列表</h4>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main padding-8">
                                <div id="treeDemo" class="ztree"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="table_menu_list" id="testIframe">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label>
                        </th>
                        <th width="80px">产品编号</th>
                        <th width="250px">产品名称</th>
                        <th width="100px">原价格</th>
                        <th width="100px">现价</th>
                        <th width="100px">所属地区/国家</th>
                        <th width="180px">加入时间</th>
                        <th width="80px">审核状态</th>
                        <th width="70px">状态</th>
                        <th width="200px">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label>
                        </td>
                        <td width="80px">45631</td>
                        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">小米 Max 全网通 高配版 3GB内存
                            64GB ROM 金色
                            移动联通电信4G手机Y</u></td>
                        <td width="100px">5467</td>
                        <td width="100px">4525</td>
                        <td width="100px">法国</td>
                        <td width="180px">2014-6-11 11:11:42</td>
                        <td class="text-l">通过</td>
                        <td class="td-status"><span class="label label-success radius">已启用</span></td>
                        <td class="td-manage">
                            <a onClick="member_stop(this,'10001')" href="javascript:;" title="停用"
                               class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                            <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"
                               class="btn btn-xs btn-info"><i
                                    class="icon-edit bigger-120"></i></a>
                            <a title="删除" href="javascript:;" onclick="member_del(this,'1')"
                               class="btn btn-xs btn-warning"><i class="icon-trash  bigger-120"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label>
                        </td>
                        <td width="80px">45631</td>
                        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">小米 Max 全网通 高配版 3GB内存
                            64GB ROM 金色
                            移动联通电信4G手机Y</u></td>
                        <td width="100px">5467</td>
                        <td width="100px">4525</td>
                        <td width="100px">法国</td>
                        <td width="180px">2014-6-11 11:11:42</td>
                        <td class="text-l">通过</td>
                        <td class="td-status"><span class="label label-success radius">已启用</span></td>
                        <td class="td-manage">
                            <a onClick="member_stop(this,'10001')" href="javascript:;" title="停用"
                               class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                            <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"
                               class="btn btn-xs btn-info"><i
                                    class="icon-edit bigger-120"></i></a>
                            <a title="删除" href="javascript:;" onclick="member_del(this,'1')"
                               class="btn btn-xs btn-warning"><i class="icon-trash  bigger-120"></i></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="/TinyLove/vib/js/jquery.min.js"></script>
<script src="/TinyLove/vib/assets/js/bootstrap.min.js"></script>
<script src="/TinyLove/vib/assets/js/typeahead-bs2.min.js"></script>
<script src="/TinyLove/vib/assets/js/jquery.dataTables.min.js"></script>
<script src="/TinyLove/vib/assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript" src="/TinyLove/vib/js/H-ui.js"></script>
<script type="text/javascript" src="/TinyLove/vib/js/H-ui.admin.js"></script>
<script src="/TinyLove/vib/assets/layer/layer.js" type="text/javascript"></script>
<script src="/TinyLove/vib/assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="/TinyLove/vib/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="/TinyLove/vib/js/lrtk.js" type="text/javascript"></script>
<script src="/TinyLove/vib/js/products.js"></script>
</body>
</html>