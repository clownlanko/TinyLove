<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="author" content="lanko"/>
    <meta name="keywords" content="微爱，婚纱"/>
    <meta name="description" content="再微小的爱也应该得到敬重。"/>
    <link rel="shortcut icon" type="image/x-icon" href="/TinyLove/vib/images/vi.png"/>
    <title>微·爱</title>
    <link href="/TinyLove/vib/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/TinyLove/vib/css/style.css" />
    <link href="/TinyLove/vib/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="/TinyLove/vib/assets/css/ace.min.css" />
    <link rel="stylesheet" href="/TinyLove/vib/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="/TinyLove/vib/assets/css/font-awesome.min.css" />
</head>
<body>
<div class=" clearfix">
    <div id="category">
        <div id="scrollsidebar" class="left_Treeview">
            <div class="show_btn" id="rightArrow"><span></span></div>
            <div class="widget-box side_content">
                <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                <div class="side_list">
                    <div class="widget-header header-color-green2">
                        <h4 class="lighter smaller">产品类型列表</h4>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main padding-8">
                            <div id="treeDemo" class="ztree"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!---->
        <iframe id="testIframe" name="testIframe" frameborder=0 scrolling=AUTO src="/TinyLove/vib/view/addProductCategory.jsp" class="page_right_style"></iframe>
    </div>
</div>
</body>
<script src="/TinyLove/vib/js/jquery.min.js"></script>
<script src="/TinyLove/vib/assets/js/ace-elements.min.js"></script>
<script src="/TinyLove/vib/assets/js/ace.min.js"></script>
<script src="/TinyLove/vib/assets/js/bootstrap.min.js"></script>
<script src="/TinyLove/vib/assets/js/typeahead-bs2.min.js"></script>
<script type="text/javascript" src="/TinyLove/vib/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="/TinyLove/vib/js/lrtk.js" type="text/javascript"></script>
<script type="text/javascript" src="/TinyLove/vib/js/categoryManage.js"></script>
</html>