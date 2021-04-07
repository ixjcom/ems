<!DOCTYPE html>
<html>

<!-- Mirrored from www.zi-han.net/theme/hplus/form_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:15 GMT -->
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

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <#--<div class="ibox-title">
                    <h5>角色检索</h5>
                </div>-->
                <div class="ibox-content">
                    <form id="roleSearchForm" method="post" class="form-horizontal">
                        <input type="hidden" name="pageNum" id="pageNo" value="1">
                        <input type="hidden" name="pageSize" id="pageSize" value="10">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色名</label>
                            <div class="col-sm-4">
                                <input name="name" type="text" class="form-control">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button id="btnSearch" class="btn btn-primary" type="button">搜索</button>
                                <button id="btnCancel" class="btn btn-white" type="button">取消</button>
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
                    <div class="table-responsive">
                        <table class="table table-striped  text-nowrap">
                            <thead>
                            <tr>
                                <th>角色名</th>
                                <th>创建时间</th>
                                <th>最后更新时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="roleTbody">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="ibox-content" style="height: 53px;">
                    <div class="page" id="rolePageDiv">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modalRoleDetail" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated fadeIn">
            <div class="modal-header" style="height: 20px;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="font-size: 22px;">角色详情</h4>
            </div>
            <div class="modal-body">
            <form id="roleDetailForm" method="post" class="form-horizontal">
                <input type="hidden" id="roleId" name="id"/>
                <div class="form-group">
                    <label class="col-sm-2 control-label">角色名</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" id="roleName" required="" minlength="2" class="form-control" placeholder="请输入角色名">
                    </div>
                </div>
            <#list permissionGroups as permissionGroup>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">${permissionGroup.name}</label>
                    <div class="col-sm-10">
                        <#list permissionGroup.permissions as permission>
                            <label class="checkbox-inline i-checks">
                                <input type="checkbox" name="permissionIds" value="${permission.id}">${permission.name}
                            </label>
                        </#list>
                    </div>
                </div>
            </#list>
                <div class="hr-line-dashed"></div>
            </form>
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <@sec.any name="ROLE_UPDATE">
                <button type="button" id="btnSaveUpdate" class="btn btn-primary">保存</button>
                </@sec.any>
            </div>
        </div>
    </div>
</div>

<textarea id="roleTr-template" style="display: none;">
    {#if $T.data.total>0}
        {#foreach $T.data.list as role}
            <tr>
                <td>{$T.role.name}</td>
                <td>{new Date($T.role.createTime).Format('yyyy-MM-dd hh:mm:ss')}</td>
                <td>{new Date($T.role.updateTime).Format('yyyy-MM-dd hh:mm:ss')}</td>
                <@sec.any name="ROLE_UPDATE,ROLE_DELETE">
                    <td>
                        <@sec.any name="ROLE_UPDATE">
                        <button type="button" roleId="{$T.role.id}" class="btn btn-primary btnRoleDetail">查看</button>
                        </@sec.any>
                        <@sec.any name="ROLE_DELETE">
                        <button type="button" roleId="{$T.role.id}" class="btn btn-danger btnRoleDelete">删除</button>
                        </@sec.any>
                    </td>
                </@sec.any>
            </tr>
        {#/for}
    {#else}
		<tr>
            <td colspan="4">暂无数据</td>
        </tr>
	{#/if}
</textarea>

<#include "/page.ftl"/>

<script>
    var _rootPath="/";
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
<script src="/js/role-list.js"></script>
</body>

</html>
