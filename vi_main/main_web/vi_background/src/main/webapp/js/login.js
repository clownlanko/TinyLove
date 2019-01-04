$(function () {
    layui.use("layer");
});
$('#login_btn').click(function() {
    var error = 0;
    $("input").each(function() {
        if ($(this).val() == "") {
            layer.alert($(this).attr("placeholder") + "不能为空！\r\n", {
                title: '微爱提示',
                icon: 0
            });
            error++;
            return false;
        }
    });
    if (error > 0) {
        return false;
    }
    $.ajax({
        type:"post",
        url:"/TinyLove/vib/vim.vi/login.vi",
        data:$("#login").serialize(),
        success:function(json){
            if(json.state==-1){
                layer.alert(json.message, {
                    title : "微爱提示",
                    icon : 2
                });
            }
            if(json.state==4){
                layer.confirm(json.message, {
                    icon:1,
                    title:"是否进入",
                    btn: ['进入','取消']
                }, function(){
                    location.href = "/TinyLove/vib/view/index.jsp";
                });
            }
        }
    });
})