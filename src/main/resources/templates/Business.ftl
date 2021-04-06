<!DOCTYPE html>
<html>
<head>

    <link rel="shortcut icon" href="${ctx}favicon.ico">
    <link href="${ctx}css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ctx}css/animate.min.css" rel="stylesheet">
    <link href="${ctx}css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${ctx}css/page.css" rel="stylesheet">
    <link href="${ctx}css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
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
		                                    <label class="col-sm-6 control-label"><@spring.message "Business.id" />：</label>
		                                    <div class="col-sm-6">
		                                        <input type="text" name="id" class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.id" />">
		                                    </div>
		                               </div>
		                        </div>
		                     	<div class="col-md-3">
		                              <div class="form-group">
		                                    <label class="col-sm-6 control-label"><@spring.message "Business.userId" />：</label>
		                                    <div class="col-sm-6">
		                                        <input type="text" name="userId" class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.userId" />">
		                                    </div>
		                               </div>
		                        </div>
		                     	<div class="col-md-3">
		                              <div class="form-group">
		                                    <label class="col-sm-6 control-label"><@spring.message "Business.fraction" />：</label>
		                                    <div class="col-sm-6">
		                                        <input type="text" name="fraction" class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.fraction" />">
		                                    </div>
		                               </div>
		                        </div>
		                     	<div class="col-md-3">
		                              <div class="form-group">
		                                    <label class="col-sm-6 control-label"><@spring.message "Business.businessCount" />：</label>
		                                    <div class="col-sm-6">
		                                        <input type="text" name="businessCount" class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.businessCount" />">
		                                    </div>
		                               </div>
		                        </div>
	               		 	 </div>
                             <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"><@spring.message "Business.updateTime" />：</label>
                                        <div class="col-sm-4">
                                            <input type="text" id="startUpdateTime" name="startUpdateTime" value="" class="form-control" placeholder="">
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="text" id="endUpdateTime" name="endUpdateTime" value="" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                </div>
								
					</div>
               </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                             <button id="BusinessBtnSearch" class="btn btn-primary" type="button"><@spring.message "button.search" /></button>
                        	<button id="BusinessBtnCancel" class="btn btn-white" type="button"><@spring.message "button.cancel" /></button>
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
                        <button type="button" class="btn btn-success " id="addBusiness">
                            <i class="fa fa-plus"></i>&nbsp;&nbsp;<span class="bold"><@spring.message "button.add" /></span>
                        </button>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th><@spring.message "button.operation" /></th>
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
<div class="modal inmodal" id="BusinessDetail" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated fadeIn">
            <div class="modal-header" style="height: 20px;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="font-size: 22px;"><@spring.message "Business.detailTitle" /></h4>
            </div>
            <div class="modal-body">
             <form id="BusinessDetailForm" method="post" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label"><@spring.message "Business.id" />:</label>
                    <div class="col-sm-10">
                        <input type="text" name="id" id="saveId" required="" minlength="2" class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.id" />">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><@spring.message "Business.userId" />:</label>
                    <div class="col-sm-10">
                        <input type="text" name="userId" id="saveUserId" required="" minlength="2" class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.userId" />">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><@spring.message "Business.fraction" />:</label>
                    <div class="col-sm-10">
                        <input type="text" name="fraction" id="saveFraction" required="" minlength="2" class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.fraction" />">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><@spring.message "Business.businessCount" />:</label>
                    <div class="col-sm-10">
                        <input type="text" name="businessCount" id="saveBusinessCount" required="" minlength="2" class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.businessCount" />">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><@spring.message "Business.updateTime" />:</label>
                    <div class="col-sm-10">
                        <input type="text" name="updateTime" id="saveUpdateTime" required="" minlength="2" class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.updateTime" />">
                    </div>
                </div>
            <div class="hr-line-dashed"></div>
            </form>
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal"><@spring.message "button.close" /></button>
                <button type="button" id="btnSaveUpdate" class="btn btn-primary"><@spring.message "button.save" /></button>
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
                <h4 class="modal-title" style="font-size: 22px;"><@spring.message "Business.addTitle" /></h4>
            </div>
            <div class="modal-body">
                <form id="BusinessAddForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><@spring.message "Business.userId" />:</label>
                            <div class="col-sm-10">
                                <input type="text" name="userId" id="addUserId" style="width:300px" required class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.userId" />">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><@spring.message "Business.fraction" />:</label>
                            <div class="col-sm-10">
                                <input type="text" name="fraction" id="addFraction" style="width:300px" required class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.fraction" />">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><@spring.message "Business.businessCount" />:</label>
                            <div class="col-sm-10">
                                <input type="text" name="businessCount" id="addBusinessCount" style="width:300px" required class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.businessCount" />">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><@spring.message "Business.updateTime" />:</label>
                            <div class="col-sm-10">
                                <input type="text" name="updateTime" id="addUpdateTime" style="width:300px" required class="form-control" placeholder="<@spring.message "system.print" /><@spring.message "Business.updateTime" />">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <button type="button" class="btn btn-white" data-dismiss="modal"><@spring.message "button.close" /></button>
                            <button class="btn btn-primary" id="btnAddBusiness" data-loading-text="正在保存..." type="button"><@spring.message "button.save" /></button>
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
                <td>
                    <button type="button" primaryKeyId="{$T.record.id}" class="btn btn-primary btnBusinessDetail"><@spring.message "button.detail" /></button>
                    <button type="button" primaryKeyId="{$T.record.id}" class="btn btn-danger btnBusinessDelete"><@spring.message "button.delete" /></button>
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
    var _rootPath="${ctx}";
</script>
<script src="${ctx}js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}js/content.min.js?v=1.0.0"></script>
<script src="${ctx}js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}js/plugins/validate/jquery.validate.min.js"></script>
<#if Session["language"]?exists&Session["language"]=="en_US"> 
<script src="${ctx}js/plugins/validate/messages_en.min.js"></script>
</#if> 
<#if Session["language"]?exists&Session["language"]=="zh_CN">  
<script src="${ctx}js/plugins/validate/messages_zh.min.js"></script>
</#if> 
<script src="${ctx}js/common.js"></script>
<script src="${ctx}js/jquery-jtemplates.js"></script>
<script src="${ctx}js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}js/dateutil.js"></script>
<script src="${ctx}js/plugins/layer/laydate/laydate.js"></script>
<script src="${ctx}js/currencyUtil.js"></script>
<script src="${ctx}${getVersion('js/page.js')}"></script>
<script src="${ctx}${getVersion('js/myscript/BusinessScript.js')}"></script>
</body>

</html>
