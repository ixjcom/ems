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
                    <@sec.any name="SAYARY_PROPERTIES_ADD">
                        <div class="row">
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-success " id="addUser">
                                    <i class="fa fa-plus"></i>&nbsp;&nbsp;<span class="bold">添加</span>
                                </button>
                            </div>
                        </div>
                    </@sec.any>
                    <div class="table-responsive">
                        <table class="table table-striped text-nowrap">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>角色</th>
                                <th>底薪</th>
                                <th>创建时间</th>
                                <th>修改时间</th>
                                <@sec.any name="SAYARY_PROPERTIES_DELETE,SAYARY_PROPERTIES_UPDATE">
                                    <th>操作</th>
                                </@sec.any>
                            </tr>
                            </thead>
                            <tbody id="UserTbody">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="ibox-content" style="height: 53px;">
                    <div class="page" id="UserPageDiv">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 修改弹框 -->
<div class="modal inmodal" id="UserDetail" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated fadeIn">
            <div class="modal-header" style="height: 20px;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                <h4 class="modal-title" style="font-size: 22px;">详情</h4>
            </div>
            <div class="modal-body">
                <form id="UserDetailForm" method="post" class="form-horizontal">
                    <input type="hidden" name="id" id="saveId">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色:</label>
                        <div class="col-sm-10">
                            <select name="roleId" class="form-control" id="saveRoleId">
                                <#list roles as e>
                                    <option value="${e.id}">${e.name}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">底薪:</label>
                        <div class="col-sm-10">
                            <input type="text" name="salary" id="saveSalary" required="" class="form-control"
                                   placeholder="请输入底薪">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" id="btnSaveUpdate" class="btn btn-primary"> 保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 新增弹框 -->
<div class="modal inmodal" id="UserAdd" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated fadeIn">
            <div class="modal-header" style="height: 20px;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                <h4 class="modal-title" style="font-size: 22px;">新增</h4>
            </div>
            <div class="modal-body">
                <form id="UserAddForm" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色:</label>
                        <div class="col-sm-10">
                            <select name="roleId" class="form-control">
                                <#list roles as e>
                                    <option value="${e.id}">${e.name}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">底薪:</label>
                        <div class="col-sm-10">
                            <input type="text" name="salary" required class="form-control"
                                   placeholder="请输入底薪">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                            <button class="btn btn-primary" id="btnAddUser" data-loading-text="正在保存..." type="button">
                                保存
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<#include "/page.ftl"/>

<textarea id="UserTr-template" style="display: none;">
    {#if $T.data.total>0}
        {#foreach $T.data.list as record}
            <tr>
                        <td>{$T.record.id}</td>
                        <td>{$T.record.roleName}</td>
                        <td>{$T.record.salary}</td>
                        <td>{new Date($T.record.createTime).Format('yyyy-MM-dd hh:mm:ss')}</td>
                        <td>{new Date($T.record.updateTime).Format('yyyy-MM-dd hh:mm:ss')}</td>
                <@sec.any name="SAYARY_PROPERTIES_DELETE,SAYARY_PROPERTIES_UPDATE">
                    <td>
                    <@sec.any name="SAYARY_PROPERTIES_UPDATE">
                        <button type="button" primaryKeyId="{$T.record.id}"
                                class="btn btn-primary btnUserDetail">详情</button>
                    </@sec.any>
                        <@sec.any name="SAYARY_PROPERTIES_DELETE">
                            <button type="button" primaryKeyId="{$T.record.id}"
                                    class="btn btn-danger btnUserDelete">删除</button>
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
<script src="/js/SalaryScript.js?v=2"></script>
</body>

</html>
