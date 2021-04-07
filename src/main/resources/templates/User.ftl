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
                    <form id="UserSearchForm" method="post" class="form-horizontal">
                        <input type="hidden" name="pageNum" id="pageNo" value="1">
                        <input type="hidden" name="pageSize" id="pageSize" value="10">
                                    <div class="form-group">
		                     	<div class="col-md-3">
		                              <div class="form-group">
		                                    <label class="col-sm-6 control-label">id：</label>
		                                    <div class="col-sm-6">
		                                        <input type="text" name="id" class="form-control" placeholder="请输入id">
		                                    </div>
		                               </div>
		                        </div>
		                     	<div class="col-md-3">
		                              <div class="form-group">
		                                    <label class="col-sm-6 control-label">用户名：</label>
		                                    <div class="col-sm-6">
		                                        <input type="text" name="userName" class="form-control" placeholder="请输入用户名">
		                                    </div>
		                               </div>
		                        </div>
		                     	<div class="col-md-3">
		                              <div class="form-group">
		                                    <label class="col-sm-6 control-label">密码：</label>
		                                    <div class="col-sm-6">
		                                        <input type="text" name="password" class="form-control" placeholder="请输入密码">
		                                    </div>
		                               </div>
		                        </div>
		                     	<div class="col-md-3">
		                              <div class="form-group">
		                                    <label class="col-sm-6 control-label">手机号：</label>
		                                    <div class="col-sm-6">
		                                        <input type="text" name="mobil" class="form-control" placeholder="请输入手机号">
		                                    </div>
		                               </div>
		                        </div>
	               		 	 </div>
                             <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">创建时间：</label>
                                        <div class="col-sm-4">
                                            <input type="text" id="startCreateTime" name="startCreateTime" value="" class="form-control" placeholder="">
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="text" id="endCreateTime" name="endCreateTime" value="" class="form-control" placeholder="">
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
					</div>
               </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                             <button id="UserBtnSearch" class="btn btn-primary" type="button">搜索</button>
                        	<button id="UserBtnCancel" class="btn btn-white" type="button">清除</button>
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
                <div class="row">
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-success " id="addUser">
                            <i class="fa fa-plus"></i>&nbsp;&nbsp;<span class="bold">添加</span>
                        </button>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped text-nowrap">
                        <thead>
                        <tr>
                                <th>编号</th>
                                <th>用户名</th>
                                <th>手机号</th>
                                <th>创建时间</th>
                                <th>修改时间</th>
                                <th>操作</th>
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
<div class="modal inmodal" id="UserDetail" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated fadeIn">
            <div class="modal-header" style="height: 20px;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="font-size: 22px;">详情</h4>
            </div>
            <div class="modal-body">
             <form id="UserDetailForm" method="post" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">id:</label>
                    <div class="col-sm-10">
                        <input type="text" name="id" id="saveId" required=""  class="form-control" placeholder="请输入id">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">用户名:</label>
                    <div class="col-sm-10">
                        <input type="text" name="userName" id="saveUserName" required=""  class="form-control" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">密码:</label>
                    <div class="col-sm-10">
                        <input type="text" name="password" id="savePassword" required=""  class="form-control" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">手机号:</label>
                    <div class="col-sm-10">
                        <input type="text" name="mobil" id="saveMobil" required=""  class="form-control" placeholder="请输入手机号">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">创建时间:</label>
                    <div class="col-sm-10">
                        <input type="text" name="createTime" id="saveCreateTime" required=""  class="form-control" placeholder="请输入创建时间">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">更新时间:</label>
                    <div class="col-sm-10">
                        <input type="text" name="updateTime" id="saveUpdateTime" required=""  class="form-control" placeholder="请输入更新时间">
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
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="font-size: 22px;">新增</h4>
            </div>
            <div class="modal-body">
                <form id="UserAddForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户名:</label>
                            <div class="col-sm-10">
                                <input type="text" name="userName" id="addUserName"  required class="form-control" placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码:</label>
                            <div class="col-sm-10">
                                <input type="text" name="password" id="addPassword"  required class="form-control" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">手机号:</label>
                            <div class="col-sm-10">
                                <input type="text" name="mobil" id="addMobil"  required class="form-control" placeholder="请输入手机号">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">创建时间:</label>
                            <div class="col-sm-10">
                                <input type="text" name="createTime" id="addCreateTime"  required class="form-control" placeholder="请输入创建时间">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">更新时间:</label>
                            <div class="col-sm-10">
                                <input type="text" name="updateTime" id="addUpdateTime"  required class="form-control" placeholder="请输入更新时间">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                            <button class="btn btn-primary" id="btnAddUser" data-loading-text="正在保存..." type="button"> 保存</button>
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
                        <td>{$T.record.userName}</td>
                        <td>{$T.record.mobil}</td>
                        <td>{new Date($T.record.createTime).Format('yyyy-MM-dd hh:mm:ss')}</td>
                        <td>{new Date($T.record.updateTime).Format('yyyy-MM-dd hh:mm:ss')}</td>
                <td>
                    <button type="button" primaryKeyId="{$T.record.id}" class="btn btn-primary btnUserDetail">详情</button>
                    <button type="button" primaryKeyId="{$T.record.id}" class="btn btn-danger btnUserDelete">删除</button>
                </td>
            </tr>
        {#/foreach}
    {#else}
		<tr>
            <td colspan="13">暂无数据</td>
        </tr>
	{#/if}
</textarea>


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
<script src="/js/UserScript.js?v=1"></script>
</body>

</html>
