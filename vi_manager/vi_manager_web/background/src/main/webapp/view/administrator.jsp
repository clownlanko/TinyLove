<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link rel="shortcut icon" href="../favicon.ico">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/style.css"/>
    <link href="../assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/ace.min.css" />
    <link rel="stylesheet" href="../font/css/font-awesome.min.css" />
    <script src="../js/jquery-1.9.1.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Widget/Validform/5.3.2/Validform.min.js"></script>
    <script src="../assets/js/typeahead-bs2.min.js"></script>
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <script src="../assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="../assets/layer/layer.js" type="text/javascript" ></script>
    <script src="../js/lrtk.js" type="text/javascript" ></script>
    <script src="../assets/layer/layer.js" type="text/javascript"></script>
    <script src="../assets/laydate/laydate.js" type="text/javascript"></script>
    <title>微爱·管理员列表</title>
</head>
<body>
<div class="page-content clearfix">
    <div class="administrator">
        <div class="d_Confirm_Order_style">
            <!--操作-->
            <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:void(0)" id="administrator_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a>
        <a href="javascript:void(0)" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
       </span>
                <span class="r_f">共：<b id="quantity"></b>人</span>
            </div>
            <!--管理员列表-->
            <div class="clearfix administrator_style" id="administrator">
                <div class="left_style">
                    <div id="scrollsidebar" class="left_Treeview">
                        <div class="show_btn" id="rightArrow"><span></span></div>
                        <div class="widget-box side_content" >
                            <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                            <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">管理员分类列表</h4></div>
                                <div class="widget-body">
                                    <ul id="widget-body" class="b_P_Sort_list"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table_menu_list"  id="testIframe">
                    <table class="table table-striped table-bordered table-hover" id="sample_table">
                        <thead>
                        <tr>
                            <th width="60px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
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
        <form action="" method="post" id="form-admin-add">
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>管理员：</label>
                <div class="formControls">
                    <input type="text" class="input-text" value="" placeholder="" id="user-name" name="user-name" datatype="*2-16" nullmsg="用户名不能为空">
                </div>
                <div class="col-4"> <span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>初始密码：</label>
                <div class="formControls">
                    <input type="password" placeholder="密码" name="userpassword" autocomplete="off" value="" class="input-text" datatype="*6-20" nullmsg="密码不能为空">
                </div>
                <div class="col-4"> <span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>确认密码：</label>
                <div class="formControls ">
                    <input type="password" placeholder="确认新密码" autocomplete="off" class="input-text Validform_error" errormsg="您两次输入的新密码不一致！" datatype="*" nullmsg="请再输入一次新密码！" recheck="userpassword" id="newpassword2" name="newpassword2">
                </div>
                <div class="col-4"> <span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>性别：</label>
                <div class="formControls  skin-minimal">
                    <label><input name="form-field-radio" type="radio" class="ace" checked="checked"><span class="lbl">保密</span></label>&nbsp;&nbsp;
                    <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;
                    <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">女</span></label>
                </div>
                <div class="col-4"> <span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>手机：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder="" id="user-tel" name="user-tel" datatype="m" nullmsg="手机不能为空">
                </div>
                <div class="col-4"> <span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>邮箱：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" placeholder="@" name="email" id="email" datatype="e" nullmsg="请输入邮箱！">
                </div>
                <div class="col-4"> <span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label">角色：</label>
                <div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="admin-role" size="1">
					<option value="0">超级管理员</option>
					<option value="1">管理员</option>
					<option value="2">栏目主辑</option>
					<option value="3">栏目编辑</option>
				</select>
				</span> </div>
            </div>
            <div class="form-group">
                <label class="form-label">备注：</label>
                <div class="formControls">
                    <textarea name="" cols="" rows="" class="textarea" placeholder="说点什么...100个字符以内" dragonfly="true" onkeyup="checkLength(this);"></textarea>
                    <span class="wordage">剩余字数：<span id="sy" style="color:Red;">100</span>字</span>
                </div>
                <div class="col-4"> </div>
            </div>
            <div>
                <input class="btn btn-primary radius" type="submit" id="Add_Administrator" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    //显示权限类别
    $.ready(
        $.ajax({
            url:"../via.vi/show.vi",
            type:"GET",
            dataType:"json",
            success:function (json) {
                if(json.state==4){
                    $("#widget-body")
                    for(var i=0;i<json.data.length;i++){
                        var manager=json.data[i];
                        var color="green";
                        if(i==0)
                            color="orange";
                        $("#widget-body").append($("<li><i class='fa fa-users "+color+"'></i>" +
                            "<a href='javascript:notice();'>"+manager.authorityName+"（"+manager.quantity+"）</a></li>"));
                    }
                }
            }
        })
    );
    function notice(){
        layer.alert("你没有权限查看其他管理员哦<br>你可以直接管辖的管理员已经在右边显示",{
            title:"微爱提示",
            icon:1
        });
    }
    //显示管理员列表
    $.ajax({
        url:"../vim.vi/vimall.vi?userId=${vim.userId}",
        dataType:"json",
        success:function (json) {
            if(json.state==3){
                layer.alert(json.message,{
                    icon:2,
                    title:"微爱提示"
                })
            }
            if(json.state==4){
                $("#quantity").html(json.data.length);
                var tbody=$("#sample_table").find("tbody");
                for(var i=0;i<json.data.length;i++){
                    var tr=$("<tr></tr>");
                    var box=$("<td><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                    var phone=$("<td>"+json.data[i].phone+"</td>");
                    var email=$("<td>"+json.data[i].email+"</td>");
                    var authorityName=$("<td>"+json.data[i].authorityName+"</td>");
                    var jobName=$("<td>"+json.data[i].jobName+"</td>");
                    var name=$("<td>"+json.data[i].userName+"</td>");
                    var id=$("<td>"+json.data[i].userId+"</td>");
                    var status=$("<td class='td-status'><span class='label label-success radius'>"+(json.data[i].status==1?"在职":json.data[i].status==-1?"离职":"停职")+"</span></td>");
                    var action=$("<td class='td-manage'></td>");
                    action.append($("<a href=\"javascript:member_stop(this,'"+json.data[i].userId+"',"+json.data[i].status+");\""+" title='停用'  class='btn btn-xs btn-success'><i class='fa fa-check  bigger-120'></i></a>"),
                        $("<a title='编辑' onclick='member_edit('编辑','member-add.html','4','','510')' href='javascript:;'  class='btn btn-xs btn-info'><i class='fa fa-edit bigger-120'></i></a>"),
                        $("<a title='删除' href='javascript:;'  onclick='member_del(this,'1')' class='btn btn-xs btn-warning' ><i class='fa fa-trash  bigger-120'></i></a>")
                    );
                    tr.append(box,id,name,phone,email,authorityName,jobName,status,action);
                    tbody.append(tr);
                }
            }
        }
    });
    jQuery(function($) {
        // var oTable1 = $('#sample_table').dataTable( {
        //     "aaSorting": [[ 1, "desc" ]],//默认第几个排序
        //     "bStateSave": true,//状态保存
        //     "aoColumnDefs": [
        //         //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
        //         {"orderable":false,"aTargets":[0,2,3,4,5,7,8,]}// 制定列不参与排序
        //     ] } );


        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function(){
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }
    });

</script>
<script type="text/javascript">
    $(function() {
        $("#administrator").fix({
            float : 'left',
            //minStatue : true,
            skin : 'green',
            durationTime :false,
            spacingw:50,//设置隐藏时的距离
            spacingh:270,//设置显示时间距
        });
    });
    //字数限制
    function checkLength(which) {
        var maxChars = 100; //
        if(which.value.length > maxChars){
            layer.open({
                icon:2,
                title:'提示框',
                content:'您输入的字数超过限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0,maxChars);
            return false;
        }else{
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    };
    //初始化宽度、高度
    $(".widget-box").height($(window).height()-215);
    $(".table_menu_list").width($(window).width()-260);
    $(".table_menu_list").height($(window).height()-215);
    //当文档窗口发生改变时 触发
    $(window).resize(function(){
        $(".widget-box").height($(window).height()-215);
        $(".table_menu_list").width($(window).width()-260);
        $(".table_menu_list").height($(window).height()-215);
    })
    laydate({
        elem: '#start',
        event: 'focus'
    });

    /*用户-停用*/
    function member_stop(obj,id,status){
        alert($(obj).parent().attr("class"));
        return;
        layer.confirm('确认要停用吗？请谨慎操作!',{
            title:"微爱提示",
            icon:3,
            btn:["确定","再想想"]
            },function(){
            //停用所管辖人员的权限
                $.ajax({
                    url:"../vim.vi/cs.vi?userId="+id+"&status="+status,
                    dataType:"json",
                    type:"PUT",
                    success:function (json) {
                        if(json.state==4){
                            // layer.msg(json.message,{icon: 5,time:1000});
                        }
                    }
                });
        });
    }
    /*用户-启用*/
    function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="fa fa-check  bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!',{icon: 6,time:1000});
        });
    }
    /*产品-编辑*/
    function member_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    /*产品-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
    /*添加管理员*/
    $('#administrator_add').on('click', function(){
        layer.open({
            type: 1,
            title:'添加管理员',
            area: ['700px',''],
            shadeClose: false,
            content: $('#add_administrator_style'),

        });
    })
    //表单验证提交
    $("#form-admin-add").Validform({

        tiptype:2,

        callback:function(data){
            //form[0].submit();
            if(data.status==1){
                layer.msg(data.info, {icon: data.status,time: 1000}, function(){
                    location.reload();//刷新页面
                });
            }
            else{
                layer.msg(data.info, {icon: data.status,time: 3000});
            }
            var index =parent.$("#iframe").attr("src");
            parent.layer.close(index);
        }
    });
</script>
</html>