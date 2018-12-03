<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"  %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../css/style.css"/>
    <link rel="shortcut icon" href="../favicon.ico">
    <link href="../assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/ace.min.css"/>
    <link rel="stylesheet" href="../font/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="../assets/css/ace-ie.min.css"/>
    <script src="../js/jquery-1.9.1.min.js"></script>
    <script src="../assets/layer/layer.js" type="text/javascript"></script>
    <script src="../assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/typeahead-bs2.min.js"></script>
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <script src="../assets/js/jquery.dataTables.bootstrap.js"></script>
    <title>个人信息管理</title>
</head>
<body>
<div class="clearfix">
    <div class="admin_info_style">
        <div class="admin_modify_style" id="Personal">
            <div class="type_title">管理员信息</div>
            <div class="xinxi">
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</label>
                    <div class="col-sm-9">
                        <input type="text" name="userName" id="userName"  value="${vim.userName}"
                                                 class="col-xs-7 text_info" disabled="disabled">
                        &nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="change_Password()"
                                             class="btn btn-warning btn-xs">修改密码</a></div>
                </div>
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right"
                                               >移动电话： </label>
                    <div class="col-sm-9"><input type="text" name="phone" id="phone" value="${vim.phone}"
                                                 class="col-xs-7 text_info" disabled="disabled"></div>
                </div>
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right"
                                               >电子邮箱： </label>
                    <div class="col-sm-9"><input type="email" name="email" id="email"  value="${vim.email}"
                        style="width: 100%;" class="col-xs-7 text_info" disabled="disabled"></div>
                </div>
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right"
                >权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限： </label>
                    <div class="col-sm-9"><span>${vim.authorityName}</span></div>
                </div>
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right"
                >权限描述： </label>
                    <div class="col-sm-9"><span>${vim.authorityRemark}</span></div>
                </div>
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right"
                >职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务： </label>
                    <div class="col-sm-9"><span>${vim.jobName}</span></div>
                </div>
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right"
                >职务描述： </label>
                    <div class="col-sm-9"><span>${vim.jobRemark}</span></div>
                </div>
                <div class="Button_operation clearfix">
                    <button onclick="modify();" class="btn btn-danger radius" type="button">修改信息</button>
                    <button onclick="save_info();" class="btn btn-success radius" type="button">保存修改</button>
                </div>
            </div>
        </div>
        <div class="recording_style">
            <div class="type_title">管理员登陆记录</div>
            <div class="recording_list">
                <table class="table table-border table-bordered table-bg table-hover table-sort" id="sample-table">
                    <thead>
                    <tr class="text-c">
                        <th><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                        <th>ID</th>
                        <th>名字</th>
                        <th>电话</th>
                        <th>邮件</th>
                        <th>职务</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <script>
                        $.ajax({
                            url:"../vim.vi/vimall.vi?userId=${vim.userId}",
                            type:"GET",
                            success:function(json){
                                if(json.state==3){
                                    layer.alert(json.message,{
                                        title:"微爱提示",
                                        icon:1});
                                }
                                if(json.state==4){//响应成功，显示数据
                                    layer.alert(json.message,{
                                        title:"微爱提示",
                                        icon:1});
                                    var tbody=$("#sample-table").find("tbody");
                                    for(var i=0;i<json.data.length;i++){
                                        var tr=$("<tr></tr>");
                                        var box=$("<td><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                                        var id=$("<td><a href=\"javascript:findByUserId('"+json.data[i].userId+"')\">"+json.data[i].userId+"</a></td>");
                                        var name=$("<td>"+json.data[i].userName+"</td>");
                                        var phone=$("<td>"+json.data[i].phone+"</td>");
                                        var email=$("<td>"+json.data[i].email+"</td>");
                                        var job=$("<td>"+json.data[i].jobName+"</td>");
                                        var status=$("<td>"+(json.data[i].status==1?"在职":json.data[i].status==-1?"离职":"停职")+"</td>");
                                        tr.append(box,id,name,phone,email,job,status);
                                        tbody.append(tr);
                                    }
                                }
                            }
                        });
                    </script>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!--修改密码样式-->
<div class="change_Pass_style" id="change_Pass">
    <ul class="xg_style">
        <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="prepwd" type="password" class=""
                                                                          id="password"></li>
        <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="password" type="password" class=""
                                                                          id="Nes_pas"></li>
        <li><label class="label_name">确认密码</label><input name="repwd" type="password" class="" id="c_mew_pas"></li>
    </ul>
</div>
</body>
</html>
<script>
    function findByUserId(e) {
        $.ajax({
            url:"../vim.vi/fbui.vi?userId="+e,
            success:function (json) {
                if(json.state==4){
                    var info="用户名:"+json.data.userName;
                    info+="<br>移动电话:"+json.data.phone;
                    info+="<br>电子邮箱:"+json.data.email;
                    info+="<br>权限:"+json.data.authorityName;
                    info+="<br>职务:"+json.data.jobName;
                    layer.alert(info,{
                        title:"微爱提示",
                        icon:1
                    })
                }
                if(json.state==-1){
                    layer.alert(json.message,{
                        title:"微爱提示",
                        icon:1
                    })
                }
            }
        });
    }
    jQuery(function($) {
        var oTable1 = $('#sample_table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 2, 3, 4, 5, 7, 8,]}// 制定列不参与排序
            ]
        });

        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });
    });
    //按钮点击事件
    function modify() {
        $('.text_info').attr("disabled", false);
        $('.text_info').addClass("add");
        $('#Personal').find('.xinxi').addClass("hover");
        $('#Personal').find('.btn-success').css({'display': 'block'});
    };

    function save_info() {
        var num = 0;
        $(".xinxi input[type$='text']").each(function () {
            if ($(this).val() == "") {
                layer.alert($(this).attr("name") + "不能为空！\r\n", {
                    title: '微爱提示',
                    icon: 0
                });
                num++;
                return false;
            }
        });
        if (num > 0) {
            return false;
        } else {

            $.ajax({
                url:"../vim.vi/us.vi",
                type:"POST",
                data:{"userId":"${vim.userId}",
                    "userName":$("#userName").val(),
                    "phone":$("#phone").val(),
                    "email":$("#email").val()
                },
                success:function (json) {
                    layer.alert(json.message, {
                        title: '微爱提示',
                        icon: 1
                    });
                }
            });
            $('#Personal').find('.xinxi').removeClass("hover");
            $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
            $('#Personal').find('.btn-success').css({'display': 'none'});
        }
    };
    //初始化宽度、高度
    $(".admin_modify_style").height($(window).height());
    $(".recording_style").width($(window).width() - 400);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".admin_modify_style").height($(window).height());
        $(".recording_style").width($(window).width() - 400);
    });

    //修改密码
    function change_Password() {
        layer.open({
            type: 1,
            title: '修改密码',
            area: ['300px', '300px'],
            shadeClose: true,
            content: $('#change_Pass'),
            btn: ['确认修改'],
            yes: function (index) {
                if ($("#password").val() == "") {
                    layer.alert('原密码不能为空!', {
                        title: '微爱提示',
                        icon: 2
                    });
                    return false;
                }
                if ($("#Nes_pas").val() == "") {
                    layer.alert('新密码不能为空!', {
                        title: '微爱提示',
                        icon: 2
                    });
                    return false;
                }
                if ($("#c_mew_pas").val() == "") {
                    layer.alert('确认新密码不能为空!', {
                        title: '微爱提示',
                        icon: 2
                    });
                    return false;
                }
                if($("#password").val()==$("#Nes_pas").val()){
                    layer.alert('与旧密码一致，无需更改', {
                        title: '提示框',
                        icon: 0
                    });
                }
                if (!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val()) {
                    layer.alert('密码不一致!', {
                        title: '微爱提示',
                        icon: 2
                    });
                    return false;
                } else {
                    $.ajax({
                        url:"../vim.vi/changepwd.vi",
                        data:{
                            "username":"${vim.userName}",
                            "oldPwd":$("#password").val(),
                            "newPwd":$("#Nes_pas").val()
                        },
                        success:function (json) {
                            layer.alert(json.message, {
                                title: '微爱提示',
                                icon: 0
                            });
                            layer.close(index);
                        },error:function () {
                            layer.msg("网络繁忙,请稍后再试",{
                                title:"微爱提示",
                                icon:1
                            });
                        }
                    });
                }
            }
        });
    }
</script>
