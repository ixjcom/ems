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
                    <form id="UserSearchForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">用户编号：</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="userId" id="selectUserId">
                                            <option value="">all</option>
                                            <#list users as e>
                                                <option value="${e.id}">${e.userName}</option>
                                            </#list>
                                        </select>
                                    </div>
                                </div>
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
                    <p id="salary"></p>
                    薪水是计算方式:月总分/月总天数/10*有效天数*底薪
                </div>
            </div>
        </div>
    </div>
</div>

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
</body>
<script>
    $(document).ready(function () {
        $("#UserBtnSearch").click(function(){
            var userId = $("#selectUserId").val();
            post("/salaryselect/select",{"userId":userId},function (result) {
                $("#salary").text("当月薪资是:"+result.data + "￥");
            });
        });
        $("#UserBtnCancel").on("click",function () {
            $("#selectUserId").val("");
        });
    });
</script>

</html>
