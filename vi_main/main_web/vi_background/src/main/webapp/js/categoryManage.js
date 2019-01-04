$(function() {
	$("#category").fix({
		float: 'left',
		//minStatue : true,
		skin: 'green',
		durationTime: false
	});
    var tree=new Array();
    $.get("/TinyLove/vib/stc/sts.vi",function (result) {
        console.info(result.data);
		for(var i=0;i<result.data.length;i++){
			for(var j=0;j<result.data[i].children.length;j++){
                var node={
                    id:result.data[i].children[j].typeId,
                    pId:result.data[i].children[j].parentId,
                    name:result.data[i].children[j].typeName,
                    remark:result.data[i].children[j].remark
                };
                tree[j]=node;
            }
		}
        // console.error(tree.toString());
    });
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: false,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "typeId",
                pIdKey: "parentId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function(treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode);
                    return false;
                } else {
                    demoIframe.attr("src", "/TinyLove/vib/view/addProductCategory.jsp?parentId="+treeNode.pId);
                    return true;
                }
            }
        }
    };
    var t = $("#treeDemo");
    t = $.fn.zTree.init(t, setting, tree);
    demoIframe = $("#testIframe");
    var zTree = $.fn.zTree.getZTreeObj("tree");
});
//初始化宽度、高度  
$(".widget-box").height($(window).height());
$(".page_right_style").width($(window).width() - 220);
//当文档窗口发生改变时 触发  
$(window).resize(function() {
	$(".widget-box").height($(window).height());
	$(".page_right_style").width($(window).width() - 220);
})

/**************/


var zNodes;

var code;

function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>" + str + "</li>");
}

$(document).ready(function() {

    // demoIframe.bind("load", loadReady);

    // zTree.selectNode(zTree.getNodeByParam("id", '11'));
});
