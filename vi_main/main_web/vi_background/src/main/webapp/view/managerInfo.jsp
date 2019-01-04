<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"  %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <link href="/TinyLove/vib/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/TinyLove/vib/css/style.css"/>
    <link rel="shortcut icon" href="/TinyLove/vib/images/vi.png">
    <link href="/TinyLove/vib/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="/TinyLove/vib/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="/TinyLove/vib/font/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/TinyLove/vib/assets/css/ace-ie.min.css"/>
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
                        &nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="change_Password('${vim.userName}')"
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
                    <button onclick="save_info('${vim.userId}');" class="btn btn-success radius" type="button">保存修改</button>
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
                    <tbody></tbody>
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
<script src="/TinyLove/vib/js/jquery.min.js"></script>
<script src="/TinyLove/vib/layui/layui.js" type="text/javascript"></script>
<script src="/TinyLove/vib/assets/js/bootstrap.min.js"></script>
<script src="/TinyLove/vib/assets/js/typeahead-bs2.min.js"></script>
<script src="/TinyLove/vib/assets/js/jquery.dataTables.min.js"></script>
<script src="/TinyLove/vib/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="/TinyLove/vib/js/managerInfo.js"></script>
<script>
    $(function () {
        layui.use("layer");
        showPersonnel('${vim.userId}');
    });
</script>
</html>
