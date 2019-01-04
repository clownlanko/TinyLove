$(function() {
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	layui.use("layer");
});
function addShopType(parentId) {
	if($("#typeName").val()==""){
        layer.msg("名称不能为空",{
            icon:3,
            title:"微爱提示"
        })
	}
	$.ajax({
		url:"/TinyLove/vib/stc/ast.vi",
		dataType:"json",
		type:"post",
		data:$("#form-user-add").serialize()+"&parentId="+(parentId|null),
		success:function (result) {
			if(result.state==4){
				layer.msg(result.message,{
					icon:6,
					title:"微爱提示"
				})
			}
            if(result.state==-1){
                layer.msg(result.message,{
                    icon:5,
                    title:"微爱提示"
                })
			}
        }
	});
}
