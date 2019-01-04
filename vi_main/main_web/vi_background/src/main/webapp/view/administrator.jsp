<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link rel="shortcut icon" href="/TinyLove/vib/images/vi.png">
    <link href="/TinyLove/vib/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/TinyLove/vib/css/style.css"/>
    <link href="/TinyLove/vib/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="/TinyLove/vib/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="/TinyLove/vib/font/css/font-awesome.min.css"/>
    <title>微爱·管理员列表</title>
</head>
<body>
<div class="page-content clearfix">
    <div class="administrator">
        <div class="d_Confirm_Order_style">
            <!--操作-->
            <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:void(0)" onclick="openAddManagerWindow()" id="administrator_add" class="btn btn-warning"><i
                class="fa fa-plus"></i> 添加管理员</a>
        <a href="javascript:void(0)" onclick="deleteManagers()" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
       </span>
                <span class="r_f">共：<b id="quantity"></b>人</span>
            </div>
            <!--管理员列表-->
            <div class="clearfix administrator_style" id="administrator">
                <div class="left_style">
                    <div id="scrollsidebar" class="left_Treeview">
                        <div class="show_btn" id="rightArrow"><span></span></div>
                        <div class="widget-box side_content">
                            <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                            <div class="side_list">
                                <div class="widget-header header-color-green2"><h4 class="lighter smaller">管理员分类列表</h4>
                                </div>
                                <div class="widget-body">
                                    <ul id="widget-body" class="b_P_Sort_list"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table_menu_list" id="testIframe">
                    <table class="table table-striped table-bordered table-hover" id="sample_table">
                        <thead>
                        <tr>
                            <th width="60px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label>
                            </th>
                            <th width="150px">编号</th>
                            <th width="80px">名字</th>
                            <th width="150px">手机</th>
                            <th width="250px">邮箱</th>
                            <th width="100px">权限</th>
                            <th width="120px">职务</th>
                            <th width="70px">状态</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!--添加管理员-->
    <div id="add_administrator_style" class="add_menber" style="display:none">
        <form id="form-admin-add">
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>管理员：</label>
                <div class="formControls">
                    <input type="text" class="input-text" placeholder="用户Id" id="user-name" name="userId"
                           datatype="*2-16" nullmsg="用户id不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>薪资：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" placeholder="薪资" id="user-tel" name="salary" datatype="m"
                           nullmsg="工作不能没有工资吧">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label">职务：</label>
                <div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" id="jobId" name="jobId" size="1">
					<option selected>--请选择--</option>
				</select>
				</span></div>
            </div>
            <div class="form-group">
                <label class="form-label">角色：</label>
                <div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" id="authorityId" name="authorityId" size="1">
					<option selected>--请选择--</option>
				</select>
				</span></div>
            </div>
            <div>
                <input class="btn btn-primary radius" type="button" onclick="addManager()"
                       value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </form>
    </div>
</div>
</body>
<script src="/TinyLove/vib/js/jquery.min.js"></script>
<script src="/TinyLove/vib/assets/js/bootstrap.min.js"></script>
<script src="/TinyLove/vib/Widget/Validform/5.3.2/Validform.min.js"></script>
<script src="/TinyLove/vib/assets/js/typeahead-bs2.min.js"></script>
<script src="/TinyLove/vib/assets/js/jquery.dataTables.min.js"></script>
<script src="/TinyLove/vib/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="/TinyLove/vib/layui/layui.js" type="text/javascript"></script>
<script src="/TinyLove/vib/js/lrtk.js" type="text/javascript"></script>
<script src="/TinyLove/vib/js/administrator.js" type="text/javascript"></script>
<script>
    $.ready(function(){
        //显示职务
        $.ajax({
            url: "/TinyLove/vib/vij.vi/query.vi",
            type: "GET",
            dataType: "json",
            success: function (json) {
                for (var i = 0; i < json.data.length; i++) {
                    $("#jobId").append("<option value='" + json.data[i].jobId + "'>" + json.data[i].jobName + "</option>");
                }
            }
        });
        //显示权限
        $.ajax({
            url: "/TinyLove/vib/via.vi/query.vi",
            type: "GET",
            dataType: "json",
            success: function (json) {
                for (var i = 0; i < json.data.length; i++) {
                    $("#authorityId").append("<option value='" + json.data[i].authorityId + "'>" + json.data[i].authorityName + "</option>");
                }
            }
        });
        //显示权限类别
        $.ajax({
            url: "/TinyLove/vib/via.vi/show.vi?userId=${vim.userId}",
            type: "GET",
            dataType: "json",
            success: function (json) {
                if (json.state == 4) {
                    $("#widget-body")
                    for (var i = 0; i < json.data.length; i++) {
                        var manager = json.data[i];
                        var color = "green";
                        if (i == 0)
                            color = "orange";
                        $("#widget-body").append($("<li><i class='fa fa-users " + color + "'></i>" +
                            "<a href='javascript:notice();'>" + manager.authorityName + "（" + manager.quantity + "）</a></li>"));
                    }
                }
            }
        })
        //显示管理员列表
        $.ajax({
            url: "/TinyLove/vib/vim.vi/vimall.vi?userId=${vim.userId}",
            dataType: "json",
            success: function (json) {
                if (json.state == 3) {
                    layer.alert(json.message, {
                        icon: 2,
                        title: "微爱提示"
                    })
                }
                if (json.state == 4) {
                    $("#quantity").html(json.data.length == null ? 0 : json.data.length);
                    var tbody = $("#sample_table").find("tbody");
                    for (var i = 0; i < json.data.length; i++) {
                        var tr = $("<tr></tr>");
                        var box = $("<td><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                        var phone = $("<td>" + json.data[i].phone + "</td>");
                        var email = $("<td>" + json.data[i].email + "</td>");
                        var authorityName = $("<td>" + json.data[i].authorityName + "</td>");
                        var jobName = $("<td>" + json.data[i].jobName + "</td>");
                        var name = $("<td>" + json.data[i].userName + "</td>");
                        var id = $("<td class='manager'>" + json.data[i].userId + "</td>");
                        var action = $("<td class='td-manage'></td>");
                        var status = json.data[i].status;
                        var state = $("<td class='td-status'><span class='" +
                            (status == 1 ? "label label-success radius" : "label label-defaunt radius") +
                            "'>" + (status == 1 ? "在职" : status == -1 ? "离职" : "停职") + "</span></td>");

                        var method = status == 1 ? "member_stop(this,'" + json.data[i].userId + "'," + status + ",'" + json.data[i].jobName + "')" :
                            status == 0 ? "member_start(this,'" + json.data[i].userId + "'," + status + ",'" + json.data[i].jobName + "')" : "";
                        action.append($("<a onclick=" + method + " href='#' title='" + (status == 0 ? "启用" : status == 1 ? "停用" : "已离职") +
                            "' class='" + (status == 1 ? "btn btn-xs btn-success" : "btn btn-xs") + "'><i class='fa fa-check  bigger-120'></i></a>"),
                            $("<a title='编辑' onclick='member_edit('编辑','member-add.html','4','','510')' href='#'  class='btn btn-xs btn-info'><i class='fa fa-edit bigger-120'></i></a>"),
                            $("<a title='删除' href='#'  onclick='member_del(this,\"" + json.data[i].userId + "\")' class='btn btn-xs btn-warning' ><i class='fa fa-trash  bigger-120'></i></a>")
                        );
                        tr.append(box, id, name, phone, email, authorityName, jobName, state, action);
                        tbody.append(tr);
                    }
                }
            }
        })
    });
</script>
</html>