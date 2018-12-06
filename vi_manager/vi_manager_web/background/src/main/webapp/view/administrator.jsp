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
        <a href="javascript:void(0)" onclick="openAddManagerWindow()" id="administrator_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a>
        <a href="javascript:void(0)" onclick="deleteManagers()" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
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
        <form id="form-admin-add">
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>管理员：</label>
                <div class="formControls">
                    <input type="text" class="input-text" placeholder="用户Id" id="user-name" name="userId" datatype="*2-16" nullmsg="用户id不能为空">
                </div>
                <div class="col-4"> <span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>薪资：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" placeholder="薪资" id="user-tel" name="salary" datatype="m" nullmsg="工作不能没有工资吧">
                </div>
                <div class="col-4"> <span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label">职务：</label>
                <div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" id="jobId" name="jobId" size="1">
					<option selected>--请选择--</option>
				</select>
				</span> </div>
            </div>
            <div class="form-group">
                <label class="form-label">角色：</label>
                <div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" id="authorityId" name="authorityId" size="1">
					<option selected>--请选择--</option>
				</select>
				</span> </div>
            </div>
            <div>
                <input class="btn btn-primary radius" type="button" onclick="addManager()" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    //显示职务
    $.ajax({
        url:"../vij.vi/query.vi",
        type:"GET",
        dataType:"json",
        success:function (json) {
            for(var i=0;i<json.data.length;i++){
                $("#jobId").append("<option value='"+json.data[i].jobId+"'>"+json.data[i].jobName+"</option>");
            }
        }
    });
    //显示权限
    $.ajax({
        url:"../via.vi/query.vi",
        type:"GET",
        dataType:"json",
        success:function (json) {
            for(var i=0;i<json.data.length;i++){
                $("#authorityId").append("<option value='"+json.data[i].authorityId+"'>"+json.data[i].authorityName+"</option>");
            }
        }
    });
    //显示权限类别
    $.ready(
        $.ajax({
            url:"../via.vi/show.vi?userId=${vim.userId}",
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
                $("#quantity").html(json.data.length==null?0:json.data.length);
                var tbody=$("#sample_table").find("tbody");
                for(var i=0;i<json.data.length;i++){
                    var tr=$("<tr></tr>");
                    var box=$("<td><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                    var phone=$("<td>"+json.data[i].phone+"</td>");
                    var email=$("<td>"+json.data[i].email+"</td>");
                    var authorityName=$("<td>"+json.data[i].authorityName+"</td>");
                    var jobName=$("<td>"+json.data[i].jobName+"</td>");
                    var name=$("<td>"+json.data[i].userName+"</td>");
                    var id=$("<td class='manager'>"+json.data[i].userId+"</td>");
                    var action=$("<td class='td-manage'></td>");
                    var status=json.data[i].status;
                    var state=$("<td class='td-status'><span class='"+
                        (status==1?"label label-success radius":"label label-defaunt radius")+
                        "'>"+ (status==1?"在职":status==-1?"离职":"停职") +"</span></td>");

                    var method=status==1?"member_stop(this,'"+json.data[i].userId+"',"+status+",'"+json.data[i].jobName+"')":
                               status==0?"member_start(this,'"+json.data[i].userId+"',"+status+",'"+json.data[i].jobName+"')":"";
                    action .append($("<a onclick="+method+" href='#' title='"+(status==0?"启用":status==1?"停用":"已离职")+
                        "' class='"+(status==1?"btn btn-xs btn-success":"btn btn-xs")+"'><i class='fa fa-check  bigger-120'></i></a>"),
                        $("<a title='编辑' onclick='member_edit('编辑','member-add.html','4','','510')' href='#'  class='btn btn-xs btn-info'><i class='fa fa-edit bigger-120'></i></a>"),
                        $("<a title='删除' href='#'  onclick='member_del(this,\""+json.data[i].userId+"\")' class='btn btn-xs btn-warning' ><i class='fa fa-trash  bigger-120'></i></a>")
                    );
                    tr.append(box,id,name,phone,email,authorityName,jobName,state,action);
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
    function member_stop(obj,id,status,jobName){
        layer.confirm('确认要停用吗？',{
            title:"微爱提示",
            icon:3,
            btn:["确定","再想想"]
        },function(){
            $.ajax({
                url: "../vim.vi/cs.vi?userId=" + id + "&status=" + status +"&jobName="+jobName,
                dataType: "json",
                type: "PUT",
                success: function (json) {
                    if (json.state == 4) {
                        layer.msg(json.message,{icon: 5,time:1000});
                        var method="member_start(this,'"+id+"',"+status+",'"+jobName+"')";
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="'+method+'" href="#" title="启用"><i class="fa fa-close bigger-120"></i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">停职</span>');
                        $(obj).remove();
                    }
                }
            });
        });
    }
    /*用户-启用*/
    function member_start(obj,id,status,jobName){
        layer.confirm('确认要启用吗？',{
            title:"微爱提示",
            icon:1,
            btn:["确定","再想想"]
        },function(){
            $.ajax({
                url: "../vim.vi/cs.vi?userId=" + id + "&status=" + status + "&jobName="+jobName,
                dataType: "json",
                type: "PUT",
                success: function (json) {
                    if (json.state == 4) {
                        var method="member_stop(this,'"+id+"',"+status+",'"+jobName+"')";
                        layer.msg(json.message,{icon: 6,time:1000});
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="'+method+'" href="#" title="停用"><i class="fa fa-check  bigger-120"></i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">在职</span>');
                        $(obj).remove();
                    }
                }
            });
        });
    }
    /*产品-编辑*/
    function member_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    //删除多个管理员
    function deleteManagers(){
        var check=$("#sample_table tbody tr td label input");//td
        var td=$("#sample_table tbody tr .manager");//td
        var box=new Array();
        var index=0;
        for(var i=0;i<td.length;i++){
            if(check.get(i).checked){
                box[index++]=td.get(i).innerHTML;
            }
        }
        console.info(box);
        $.ajax({
            url:"../vim.vi/dms.vi",
            data:"userId="+box,
            type:"POST",
            dataType:"json",
            success:function (json) {
                layer.msg(json.message,{icon:3,title:"微爱提示",time:2000})
            }
        });
    }
    /*管理员-删除*/
    function member_del(obj,userId){
        layer.confirm('确认要删除吗？',{
            title:"微爱提示",
            icon:1,
            btn:["确定","再想想"]
        },function(){
            $.ajax({
                url:"../vim.vi/dm.vi",
                type:"POST",
                data:"userId="+userId,
                dataType:"json",
                success:function (json) {
                    console.info(json);
                    if(json.state==4){
                        layer.msg(json.message,{icon:1,time:1000});
                        $(obj).parents("tr").remove();
                    }
                    if(json.state==3){
                        layer.msg(json.message,{icon:5,time:1000});
                    }
                    if(json.state==-1){
                        layer.msg(json.message,{icon:2,time:1000});
                    }
                }
            });
        });
    }
    /*添加管理员*/
    var index=-1;
    function openAddManagerWindow(){
        index=layer.open({
            type: 1,
            title:'添加管理员',
            area: ['700px',''],
            shadeClose: false,
            content: $('#add_administrator_style')
        });
    }
    function addManager(){
        layer.close(index);
        $.ajax({
            url:"../vim.vi/am.vi",
            type:"POST",
            dataType:"json",
            data:$("#form-admin-add").serialize(),
            success:function (json) {
                layer.alert(json.message,{
                    title:"微爱提示",
                    icon:1
                });
            }
        });
    }
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