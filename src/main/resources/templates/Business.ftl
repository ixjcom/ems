<!DOCTYPE html>
<html>
<head>

    <link rel="shortcut icon" href="/favicon.ico">
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
                    <form id="BusinessSearchForm" method="post" class="form-horizontal">
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
                                    <label class="col-sm-6 control-label">用户编号：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="userId" class="form-control" placeholder="请输入用户编号">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="col-sm-6 control-label">分数：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="fraction" class="form-control" placeholder="请输入分数">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="col-sm-6 control-label">业务次数：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="businessCount" class="form-control" placeholder="请输入业务次数">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">更新时间：</label>
                                    <div class="col-sm-4">
                                        <input type="text" id="startUpdateTime" name="startUpdateTime" value="" class="form-control" placeholder="">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" id="endUpdateTime" name="endUpdateTime" value="" class="form-control" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button id="BusinessBtnSearch" class="btn btn-primary" type="button">搜索</button>
                                <button id="BusinessBtnCancel" class="btn btn-white" type="button">清除</button>
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
                    <@sec.any name="USER_BUSINESS_ADD">
                    <div class="row">
                        <div class="col-sm-3">
                            <button type="button" class="btn btn-success " id="addBusiness">
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
                                <th>用户编号</th>
                                <th>分数</th>
                                <th>业务次数</th>
                                <th>更新时间</th>
                                <@sec.any name="USER_BUSINESS_DELETE,USER_BUSINESS_UPDATE">
                                <th>操作</th>
                                </@sec.any>
                            </tr>
                            </thead>
                            <tbody id="BusinessTbody">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="ibox-content" style="height: 53px;">
                    <div class="page" id="BusinessPageDiv">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 修改弹框 -->
<div class="modal inmodal" id="BusinessDetail" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated fadeIn">
            <div class="modal-header" style="height: 20px;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="font-size: 22px;"><@spring.message "Business.detailTitle" /></h4>
            </div>
            <div class="modal-body">
                <form id="BusinessDetailForm" method="post" class="form-horizontal">
                    <input type="hidden" name="id" id="saveId" required="" class="form-control" placeholder="请输入编号">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户编号:</label>
                        <div class="col-sm-10">
                            <input type="text" name="userId" id="saveUserId" required="" class="form-control" placeholder="请输入用户编号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分数:</label>
                        <div class="col-sm-10">
                            <input type="text" name="fraction" id="saveFraction" required="" class="form-control" placeholder="请输入分数">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">业务次数:</label>
                        <div class="col-sm-10">
                            <input type="text" name="businessCount" id="saveBusinessCount" required="" class="form-control" placeholder="请输入业务次数">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" id="btnSaveUpdate" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 新增弹框 -->
<div class="modal inmodal" id="BusinessAdd" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated fadeIn">
            <div class="modal-header" style="height: 20px;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="font-size: 22px;">新增</h4>
            </div>
            <div class="modal-body">
                <form id="BusinessAddForm" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户编号:</label>
                        <div class="col-sm-10">
                            <input type="text" name="userId" id="addUserId" required class="form-control" placeholder="请输入用户编号">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分数:</label>
                        <div class="col-sm-10">
                            <input type="text" name="fraction" id="addFraction" required class="form-control" placeholder="请输入分数">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">业务次数:</label>
                        <div class="col-sm-10">
                            <input type="text" name="businessCount" id="addBusinessCount" required class="form-control" placeholder="请输入业务次数">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                            <button class="btn btn-primary" id="btnAddBusiness" data-loading-text="正在保存..." type="button">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<#include "/page.ftl"/>

<textarea id="BusinessTr-template" style="display: none;">
    {#if $T.data.total>0}
        {#foreach $T.data.list as record}
            <tr>
                        <td>{$T.record.id}</td>
                        <td>{$T.record.userId}</td>
                        <td>{$T.record.fraction}</td>
                        <td>{$T.record.businessCount}</td>
                        <td>{new Date($T.record.updateTime).Format('yyyy-MM-dd hh:mm:ss')}</td>
                <@sec.any name="USER_BUSINESS_DELETE,USER_BUSINESS_UPDATE">
                <td>
                    <@sec.any name="USER_BUSINESS_DELETE,USER_BUSINESS_UPDATE">
                    <button type="button" primaryKeyId="{$T.record.id}" class="btn btn-primary btnBusinessDetail">详情</button>
                    </@sec.any>

                    <@sec.any name="USER_BUSINESS_DELETE,USER_BUSINESS_UPDATE">
                    <button type="button" primaryKeyId="{$T.record.id}" class="btn btn-danger btnBusinessDelete">删除</button>
                    </@sec.any>

                </td>
                </@sec.any>
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
<script src="/js/BusinessScript.js"></script>
</body>

</html>
