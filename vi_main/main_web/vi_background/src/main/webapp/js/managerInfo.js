function findByUserId(userId) {
    $.ajax({
        url:"/TinyLove/vib/vim.vi/fbui.vi?userId="+userId,
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
$(function() {
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
    //初始化宽度、高度
    $(".admin_modify_style").height($(window).height());
    $(".recording_style").width($(window).width() - 400);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".admin_modify_style").height($(window).height());
        $(".recording_style").width($(window).width() - 400);
    });
});
//按钮点击事件
function modify() {
    $('.text_info').attr("disabled", false);
    $('.text_info').addClass("add");
    $('#Personal').find('.xinxi').addClass("hover");
    $('#Personal').find('.btn-success').css({'display': 'block'});
};

function save_info(userId) {
    console.info(userId)
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
            url:"/TinyLove/vib/vim.vi/us.vi",
            type:"POST",
            data:{"userId":userId,
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
//修改密码
function change_Password(user) {
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
                    icon: 1
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
                    url:"/TinyLove/vib/vim.vi/changepwd.vi",
                    data:{
                        "username":user,
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
//展示所管辖成
function showPersonnel(userId) {
    $.ajax({
        url:"/TinyLove/vib/vim.vi/vimall.vi?userId="+userId,
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
}