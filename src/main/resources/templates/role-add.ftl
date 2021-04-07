<!DOCTYPE html>
<html>
<!-- Mirrored from www.zi-han.net/theme/hplus/form_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:15 GMT -->
<head>
    <link rel="shortcut icon" href="favicon.ico">
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
                <div class="ibox-content">
                    <form id="roleForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色名</label>
                            <div class="col-sm-4">
                                <input type="text" id="roleName" name="name" required minlength="1" maxlength="255" class="form-control" placeholder="请输入角色名,角色名不能重复">
                            </div>
                        </div>
                        <#list permissionGroups as permissionGroup>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">${permissionGroup.name}</label>
                                <div class="col-sm-10">
                                    <#list permissionGroup.permissions as permission>
                                        <label class="checkbox-inline i-checks">
                                            <input type="checkbox" name="permissionIds" value="${permission.id}">${permission.name}</label>
                                    </#list>
                                </div>
                            </div>
                        </#list>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" id="btnAddRole" data-loading-text="正在保存..." type="button">添加角色</button>
                                <button class="btn btn-white" id="btnCancel" type="button">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/metisMenu/jquery.metisMenu.js"></script>
<script src="/js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/js/layer/layer.min.js"></script>
<script src="/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="/js/contabs.min.js"></script>
<script src="/js/contabs.min.js"></script>
<script src="/js/common.js"></script>
<script src="/js/icheck.min.js"></script>
<script src="/js/sweetalert/sweetalert.min.js"></script>
<script src="/js/validate/jquery.validate.min.js"></script>
<script src="/js/validate/messages_zh.min.js"></script>
<script>
    $(document).ready(function () {
        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
        $("#btnAddRole").on("click",function () {
            if($("#roleForm").valid()){
                if($("input[name='permissionIds']:checked").length > 0){
                    $(this).button('loading');
                    post("/adminRole/insert",$("#roleForm").serialize(),function (result) {
                        $("#btnAddRole").button('reset');
                        if(result.success==true){
                            swal({title:"提示", text:"保存角色成功",type:'success'},function () {
                                window.location.reload();
                            });
                        }
                    });
                }else{
                    swal({title:"提示", text:"至少选择一项权限。",type:'warning'});
                }
            }
        });
        $("#btnCancel").on("click",function () {
            $("#roleName").val("");
        });
    });
</script>
<#--<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>-->
</body>
</html>
