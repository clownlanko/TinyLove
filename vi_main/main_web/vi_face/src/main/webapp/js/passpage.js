$(document).ready(function() {
	$.backstretch([
		"/TinyLove/vif/images/background/background1.jpg"
	], {
		duration: 3000,
		fade: 750
	});
	$(".veen .rgstr-btn button").click(function() {
		$('.veen .wrapper').addClass('move');
	});
	$(".veen .login-btn button").click(function() {
		$('.veen .wrapper').removeClass('move');
	});
    layui.use('layer')
});
function checkIsEmpty(list) {
    for(var i=0;i<list.length;i++){
        var input=$(list[i]);
        if(input.val()==""){
            layer.msg(input.attr("title")+"不能为空",{
                icon:2,
                title:"微爱提示"
            })
            input.focus();
            return false;
        }
    }
    return true;
}
function clearInput(list) {
    for(var i=0;i<list.length;i++){
        list[i].value="";
    }
}
function login(){
    var list=$("#login input");
    if(!checkIsEmpty(list))
        return;
    var form="";
    for(var i=0;i<list.length;i++){
        var input=$(list[i]);
        form+=input.attr("name")+"="+input.val()+"&";
    }
    $.get("/TinyLove/vif/pc/log.vi?"+form.substring(0,form.length-1),function (result) {
        if(result.state==4){
            clearInput(list);
            layer.msg(result.message,{
                title:"微爱提示",
                icon:6,
                end:function () {
                    location.href="/TinyLove/vif/view/home.jsp";
                }
            });
        }
        if(result.state==-1){
            layer.msg(result.message,{
                title:"微爱提示",
                icon:5
            });
        }
    });
}
function register(){
    var list=$("#register input");
    if(!checkIsEmpty(list))
        return;
    if($(list[list.length-2]).val()!=$(list[list.length-1]).val()){
        layer.msg("两次密码不一致",{
            title:"微爱提示",
            icon:3
        });
        return;
    }
    var form="";
    for(var i=0;i<list.length-1;i++){
        var input=$(list[i]);
        form+=input.attr("name")+"="+input.val()+"&";
    }
    $.get("/TinyLove/vif/pc/reg.vi?"+form.substring(0,form.length-1),function (result) {
        if(result.state==4){
            clearInput(list);
            layer.msg(result.message,{
                title:"微爱提示",
                icon:5,
                end:function () {
                    location.href="/TinyLove/vif/view/home.jsp";
                }
            });
        }
        if(result.state==1){
            layer.msg(result.message,{
                title:"微爱提示",
                icon:6
            });
        }
        if(result.state==-1){
            layer.msg(result.message,{
                title:"微爱提示",
                icon:3
            });
        }
    })
}
function checkPhone(telephone) {
    if(telephone!=""){
        var mobileReg = /^1[3456789]\d{9}$/;
        var flag=-1;
        if(mobileReg.test(telephone)){
            flag+=1;
            $.get("/TinyLove/vif/pc/cp.vi?phone="+telephone,function (result) {
                console.info(result)
                if(result.state==-1){
                    layer.msg(result.message,{
                        title:"微爱提示",
                        icon:1
                    });
                }
                if(result.state==4){
                    flag+=1;
                }
            });
        }else{
            layer.msg(telephone+"不合法,请更换",{
                title:"微爱提示",
                icon:5
            });
        }
        return flag!=-1;
    }
    return false;
}
function sendActiveCode(ele){
    var phone=$(ele).parent().prev().children("input").val();
    $(ele).attr("disabled","disabled");
    var ss=60;
    //发送下一次验证码倒计时
    var timer=setInterval(function(){
        ss-=1;
        if(ss<0){
            ss=60;
            $(ele).removeAttr("disabled");
            clearInterval(timer);
        }
        $(ele).html("获取验证码("+ss+"s)");
    },1000)
    //发送验证码
    $.get("/TinyLove/vif/pc/sac.vi?phone="+phone,function(result){
        layer.msg(result.message,{
            title:"微爱提示",
            icon:0
        })
    });
}
function openForgetPasswordPannel(){
    layer.open({
        type: 1,
        title: "修改密码",
        content:$(".forget-password-pannel")
    } );
}
function changePassword() {
    var list=$(".forget-password-pannel input");
    if(!checkIsEmpty(list))
        return;
    if($(list[list.length-2]).val()!=$(list[list.length-1]).val()){
        layer.msg("两次密码不一致",{
            title:"微爱提示",
            icon:3
        });
        return;
    }
    var form="";
    for(var i=0;i<list.length-1;i++){
        var input=$(list[i]);
        form+=input.attr("name")+"="+input.val()+"&";
    }
    $.get("/TinyLove/vif/pc/cps.vi?"+form.substring(0,form.length-1),function (result) {
        if(result.state==4){
            clearInput(list);
            layer.msg(result.message,{
                title:"微爱提示",
                icon:5
            });
        }
        if(result.state==1){
            layer.msg(result.message,{
                title:"微爱提示",
                icon:6
            });
        }
        if(result.state==-1){
            layer.msg(result.message,{
                title:"微爱提示",
                icon:3
            });
        }
    });
}