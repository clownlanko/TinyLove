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
    <link href="/TinyLove/vib/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/TinyLove/vib/css/style.css" />
    <link href="/TinyLove/vib/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="/TinyLove/vib/assets/css/ace.min.css" />
    <link rel="stylesheet" href="/TinyLove/vib/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="/TinyLove/vib/assets/css/font-awesome.min.css" />
    <link href="/TinyLove/vib/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="/TinyLove/vib/Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
    <title>微·爱</title>
</head>
<body>
<div class="clearfix" id="add_picture">
    <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="widget-box side_content">
            <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
            <div class="side_list">
                <div class="widget-header header-color-green2">
                    <h4 class="lighter smaller">选择产品类型</h4>
                </div>
                <div class="widget-body">
                    <div class="widget-main padding-8">
                        <div id="treeDemo" class="ztree"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page_right_style">
        <div class="type_title">添加商品</div>
        <form action="" method="post" class="form form-horizontal" id="form-article-add">
            <div class="clearfix cl">
                <label class="form-label col-2"><span class="c-red">*</span>图片标题：</label>
                <div class="formControls col-10"><input type="text" class="input-text" value="" placeholder=""  name=""></div>
            </div>
            <div class=" clearfix cl">
                <label class="form-label col-2">简略标题：</label>
                <div class="formControls col-10"><input type="text" class="input-text" value="" placeholder=""  name=""></div>
            </div>
            <div class=" clearfix cl">

                <div class="Add_p_s">
                    <label class="form-label col-2">产品编号：</label>
                    <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder=""  name=""></div>
                </div>
                <div class="Add_p_s">
                    <label class="form-label col-2">产&nbsp;&nbsp;&nbsp;&nbsp;地：</label>
                    <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder=""  name=""></div>
                </div>
                <div class="Add_p_s">
                    <label class="form-label col-2">材&nbsp;&nbsp;&nbsp;&nbsp;质：</label>
                    <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder=""  name=""></div>
                </div>
                <div class="Add_p_s">
                    <label class="form-label col-2">品&nbsp;&nbsp;&nbsp;&nbsp;牌：</label>
                    <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder=""  name=""></div>
                </div>
                <div class="Add_p_s">
                    <label class="form-label col-2">产品重量：</label>
                    <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder=""  name="">kg</div>
                </div>
                <div class="Add_p_s">
                    <label class="form-label col-2">单位：</label>
                    <div class="formControls col-2"><span class="select-box">
									<select class="select">
										<option>请选择</option>
										<option value="1">件</option>
										<option value="2">斤</option>
										<option value="3">KG</option>
										<option value="4">吨</option>
										<option value="5">套</option>
									</select>
								</span></div>
                </div>
                <div class="Add_p_s">
                    <label class="form-label col-2">展示价格：</label>
                    <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder=""  name="">元</div>
                </div>
                <div class="Add_p_s">
                    <label class="form-label col-2">市场价格：</label>
                    <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder=""  name="">元</div>
                </div>


            </div>

            <div class="clearfix cl">
                <label class="form-label col-2">关键词：</label>
                <div class="formControls col-10">
                    <input type="text" class="input-text" value="" placeholder="" name="">
                </div>
            </div>
            <div class="clearfix cl">
                <label class="form-label col-2">内容摘要：</label>
                <div class="formControls col-10">
							<textarea name="" cols="" rows="" class="textarea" placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true"
                                      nullmsg="备注不能为空！" onKeyUp="textarealength(this,200)"></textarea>
                    <p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
                </div>
            </div>

            <div class="clearfix cl">
                <label class="form-label col-2">图片上传：</label>
                <div class="formControls col-10">
                    <div class="uploader-list-container">
                        <div class="queueList">
                            <div id="dndArea" class="placeholder">
                                <div id="filePicker-2"></div>
                                <p>或将照片拖到这里，单次最多可选300张</p>
                            </div>
                        </div>
                        <div class="statusBar" style="display:none;">
                            <div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
                            <div class="info"></div>
                            <div class="btns">
                                <div id="filePicker2"></div>
                                <div class="uploadBtn">开始上传</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix cl">
                <label class="form-label col-2">详细内容：</label>
                <div class="formControls col-10">
                    <div id="editor" type="text/plain" style="width:100%;height:400px;"></div>
                    </div>
                    </div>
                    <div class="clearfix cl">
                        <label class="form-label col-2">允许评论：</label>
                    <div class="formControls col-2 skin-minimal">
                        <div class="check-box" style=" margin-top:9px"><input type="checkbox" id="checkbox-1"><label for="checkbox-1">&nbsp;</label></div>
                    </div>
                    </div>
                    <div class="clearfix cl">
                        <div class="Button_operation">
                        <button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="icon-save "></i>保存并提交审核</button>
                    <button onClick="article_save();" class="btn btn-secondary  btn-warning" type="button"><i class="icon-save"></i>保存草稿</button>
                    <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
                    </div>
                    </div>
                    </form>
                    </div>
                    </div>
                    </div>
                    <script src="/TinyLove/vib/js/jquery.min.js"></script>
                    <script src="/TinyLove/vib/assets/js/bootstrap.min.js"></script>
                    <script src="/TinyLove/vib/assets/js/typeahead-bs2.min.js"></script>
                    <script src="/TinyLove/vib/assets/layer/layer.js" type="text/javascript"></script>
                    <script src="/TinyLove/vib/assets/laydate/laydate.js" type="text/javascript"></script>
                    <script type="text/javascript" src="/TinyLove/vib/Widget/My97DatePicker/WdatePicker.js"></script>
                    <script type="text/javascript" src="/TinyLove/vib/Widget/icheck/jquery.icheck.min.js"></script>
                    <script type="text/javascript" src="/TinyLove/vib/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
                    <script type="text/javascript" src="/TinyLove/vib/Widget/Validform/5.3.2/Validform.min.js"></script>
                    <script type="text/javascript" src="/TinyLove/vib/Widget/webuploader/0.1.5/webuploader.min.js"></script>
                    <script type="text/javascript" src="/TinyLove/vib/Widget/ueditor/1.4.3/ueditor.config.js"></script>
                    <script type="text/javascript" src="/TinyLove/vib/Widget/ueditor/1.4.3/ueditor.all.min.js"> </script>
                    <script type="text/javascript" src="/TinyLove/vib/Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
                    <script src="/TinyLove/vib/js/lrtk.js" type="text/javascript"></script>
                    <script type="text/javascript" src="/TinyLove/vib/js/H-ui.js"></script>
                    <script type="text/javascript" src="/TinyLove/vib/js/H-ui.admin.js"></script>
                    <script src="/TinyLove/vib/js/addProduct.js"></script>
</body>
</html>