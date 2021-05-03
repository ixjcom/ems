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
                    <form id="UserInfoSearchForm" method="post" class="form-horizontal">
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
                                    <label class="col-sm-6 control-label">登录次数：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="loginCount" class="form-control" placeholder="请输入登录次数">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="col-sm-6 control-label">ip：</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="loginIp" class="form-control" placeholder="请输入ip">
                                    </div>
                                </div>
                            </div>
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
                                <button id="UserInfoBtnSearch" class="btn btn-primary" type="button">搜索</button>
                                <button id="UserInfoBtnCancel" class="btn btn-white" type="button">清除</button>
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
                        <table class="table table-striped text-nowrap">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>用户编号</th>
                                <th>头像</th>
                                <th>职位类型</th>
                                <th>登录次数</th>
                                <th>登录IP</th>
                                <th>更新时间</th>
                            </tr>
                            </thead>
                            <tbody id="UserInfoTbody">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="ibox-content" style="height: 53px;">
                    <div class="page" id="UserInfoPageDiv">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/page.ftl"/>

<textarea id="UserInfoTr-template" style="display: none;">
    {#if $T.data.total>0}
        {#foreach $T.data.list as record}
            <tr>
                        <td>{$T.record.id}</td>
                        <td>{$T.record.userId}</td>
                        <td>{#if $T.record.image!=null && $T.record.image!=''}
                                <img src="{$T.record.image}" width="50px" height="50px">
                            {#/if}
                        </td>
                        <td>
                            <#list roles as e>
                                {#if ${e.id}==$T.record.postType}
                                    ${e.name}
                                {#/if}
                            </#list>
                        </td>
                        <td>{$T.record.loginCount}</td>
                        <td>{$T.record.loginIp}</td>
                        <td>{new Date($T.record.updateTime).Format('yyyy-MM-dd hh:mm:ss')}</td>
<#--                <@sec.any name="USER_INFO_DELETE,USER_INFO_UPDATE">
                <td>
                    <@sec.any name="USER_INFO_UPDATE">
                        <button type="button" primaryKeyId="{$T.record.id}" class="btn btn-primary btnUserInfoDetail">详情</button>
                    </@sec.any>
                    <@sec.any name="USER_INFO_DELETE">
                        <button type="button" primaryKeyId="{$T.record.id}" class="btn btn-danger btnUserInfoDelete">删除</button>
                    </@sec.any>
                </td>
                </@sec.any>-->
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
<script src="/js/UserInfoScript.js"></script>
</body>

</html>
