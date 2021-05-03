<!DOCTYPE html>
<html>
<head>

    <link rel="shortcut icon" href="/image/favicon.ico">
    <link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/css/iCheck/custom.css" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/css/page.css" rel="stylesheet">
    <link href="/css/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="/css/dropzone/dropzone.css" rel="stylesheet">
    <link href="/css/summernote/summernote.css" rel="stylesheet">
    <link href="/css/summernote/summernote-bs3.css" rel="stylesheet">
</head>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <form id="NotifySearchForm" method="post" class="form-horizontal">
                        <input type="hidden" name="pageNum" id="pageNo" value="1">
                        <input type="hidden" name="pageSize" id="pageSize" value="10">
                        <div class="form-group">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="col-sm-6 control-label">编号：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="id" class="form-control" placeholder="请输入编号">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="col-sm-6 control-label">标题：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="title" class="form-control" placeholder="请输入标题">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">发布时间：</label>
                                    <div class="col-sm-4">
                                        <input type="text" id="startReleaseTime" name="startReleaseTime" value="" class="form-control" placeholder="">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" id="endReleaseTime" name="endReleaseTime" value="" class="form-control" placeholder="">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="col-sm-6 control-label">发布者名称：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="releaseUser" class="form-control" placeholder="请输入发布者名称">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="col-sm-6 control-label">发布者编号：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="releaseUserId" class="form-control" placeholder="请输入发布者编号">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="col-sm-6 control-label">是否显示：</label>
                                    <div class="col-sm-6">
                                        <select name="isShow" class="form-control">
                                            <option value="">all</option>
                                            <option value="1">显示</option>
                                            <option value="0">隐藏</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="col-sm-6 control-label">内容：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="content" class="form-control" placeholder="请输入内容">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button id="NotifyBtnSearch" class="btn btn-primary" type="button">搜索</button>
                                <button id="NotifyBtnCancel" class="btn btn-white" type="button">清除</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <@sec.any name="NOTIFY_ADD">
                        <div class="row">
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-success " id="addNotify">
                                    <i class="fa fa-plus"></i>&nbsp;&nbsp;<span class="bold">新增</span>
                                </button>
                            </div>
                        </div>
                    </@sec.any>
                    <div class="table-responsive">
                        <table class="table table-striped text-nowrap">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>标题</th>
                                <th>是否显示</th>
                                <th>内容</th>
                                <th>发布者名称</th>
                                <th>发布者内容</th>
                                <th>发布时间</th>
                            </tr>
                            </thead>
                            <tbody id="NotifyTbody">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="ibox-content" style="height: 53px;">
                    <div class="page" id="NotifyPageDiv">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 新增弹框 -->
<div class="modal inmodal" id="NotifyAdd" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated fadeIn">
            <div class="modal-header" style="height: 20px;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="font-size: 22px;">新增</h4>
            </div>
            <div class="modal-body">
                <form id="NotifyAddForm" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">标题:</label>
                        <div class="col-sm-10">
                            <input type="text" name="title" id="addTitle" required class="form-control" placeholder="请输入标题">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否显示:</label>
                        <div class="col-sm-10">
                            <select name="isShow" class="form-control">
                                <option value="">all</option>
                                <option value="1">显示</option>
                                <option value="0">隐藏</option>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">内容:</label>
                        <div class="col-sm-10">
                            <input type="text" name="content" id="addContent" required class="form-control" placeholder="请输入内容">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                            <button class="btn btn-primary" id="btnAddNotify" data-loading-text="正在保存..." type="button">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<#include "/page.ftl"/>

<textarea id="NotifyTr-template" style="display: none;">
    {#if $T.data.total>0}
        {#foreach $T.data.list as record}
            <tr>
                        <td>{$T.record.id}</td>
                        <td>{$T.record.title}</td>
                        <td>{$T.record.isShow}</td>
                        <td>{$T.record.content}</td>
                        <td>{$T.record.releaseUserId}</td>
                        <td>{$T.record.releaseUser}</td>
                        <td>{new Date($T.record.releaseTime).Format('yyyy-MM-dd hh:mm:ss')}</td>
            </tr>
        {#/foreach}
    {#else}
		<tr>
            <td colspan="13">暂无数据</td>
        </tr>
	{#/if}
</textarea>


<script>
    var _rootPath = "/";
</script>
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/js/validate/jquery.validate.min.js"></script>
<script src="/js/content.min.js?v=1.0.0"></script>
<script src="/js/icheck.min.js"></script>
<script src="/js/common.js"></script>
<script src="/js/jquery-jtemplates.js"></script>
<script src="/js/sweetalert/sweetalert.min.js"></script>
<script src="/js/dateutil.js"></script>
<script src="/js/layer/laydate/laydate.js"></script>
<script src="/js/dropzone/dropzone.js"></script>
<script src="/js/summernote/summernote.min.js"></script>
<script src="/js/summernote/summernote-zh-CN.js"></script>
<script src="/js/currencyUtil.js"></script>
<script src="/js/page.js"></script>
<script src="/js/NotifyScript.js"></script>
</body>

</html>
