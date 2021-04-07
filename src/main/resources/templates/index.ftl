<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ems</title>
    <link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/css/dropzone/dropzone.css" rel="stylesheet">
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element" id="current-env" env="daily"
                         style="text-align: center;font-size: 18px;font-weight: 600; color: #fff;">${emsSystemName}
                    </div>
                    <div class="logo-element">H</div>
                </li>

                <@sec.any name="USER_ACCOUNT">
                    <li>
                        <a href="#">
                            <i class="fa fa-cogs"></i>
                            <span class="nav-label">用户管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="/user/to-list" class="J_menuItem">用户账号管理</a></li>
                        </ul>
                    </li>
                </@sec.any>

                <@sec.any name="USER_ROLE,USER_ROLE_ADD">
                    <li>
                        <a href="#">
                            <i class="fa fa-cogs"></i>
                            <span class="nav-label">角色管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <@sec.any name="USER_ROLE_ADD">
                                <li><a href="/adminRole/to-add" class="J_menuItem">新增角色</a></li>
                            </@sec.any>
                            <@sec.any name="USER_ROLE">
                                <li><a href="/adminRole/to-list" class="J_menuItem">角色列表</a></li>
                            </@sec.any>
                        </ul>
                    </li>
                </@sec.any>

                <@sec.any name="NOTIFY">
                    <li>
                        <a href="#">
                            <i class="fa fa-cogs"></i>
                            <span class="nav-label">通知公告管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="/notify/to-list" class="J_menuItem">公告管理</a></li>
                        </ul>
                    </li>
                </@sec.any>

                <@sec.any name="USER_INFO">
                    <li>
                        <a href="#">
                            <i class="fa fa-cogs"></i>
                            <span class="nav-label">柜员信息管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="/userinfo/to-list" class="J_menuItem">柜员信息管理</a></li>
                        </ul>
                    </li>
                </@sec.any>

                <@sec.any name="USER_BUSINESS">
                    <li>
                        <a href="#">
                            <i class="fa fa-cogs"></i>
                            <span class="nav-label">柜员业务管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="/business/to-list" class="J_menuItem">柜员业务管理</a></li>
                        </ul>
                    </li>
                </@sec.any>
                <@sec.any name="PERFORMANCE_RANKING">
                    <li>
                        <a href="#">
                            <i class="fa fa-cogs"></i>
                            <span class="nav-label">数据统计</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a href="/datarank/to-list" class="J_menuItem">业绩排行</a></li>
                            <li><a href="/datarank/toFraction" class="J_menuItem">分数排行</a></li>
                        </ul>
                    </li>
                </@sec.any>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header" style="width: 97%"><a
                            class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i
                                class="fa fa-bars"></i> </a>
                    <div class="dropdown profile-element" style="float: right">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="false">
                            <span class="clear">
                                <span class="block m-t-xs"><strong class="font-bold">${user.userName}</strong></span>
                                <span class="text-muted text-xs block">操作<b class="caret"></b></span>
                            </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li class="divider"></li>
                            <li><a href="logout">loginOut</a>
                            <li><a href="javascript:updatePassword();">修改密码</a></li>
                            <li><a href="javascript:updateImage();">修改头像</a></li>
                        </ul>
                    </div>
                    <div class="dropdown profile-element" style="margin-right: 20px;border-radius: 30px">
                        <img src="/image/${user.image!""}" width="50px" height="50px" id="userImage">
                    </div>
                </div>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">通知</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight" style="right:372px"><i class="fa fa-forward"></i>
            </button>

            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span
                            class="caret"></span>
                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项</a>
                    </li>
                </ul>
            </div>
            <a href="logout" class="roll-nav roll-right J_tabExit" style="width: 120px"><i
                        class="fa fa fa-sign-out"></i>安全退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="/index/index_sum" frameborder="0"
                    data-id="index_v1.html" seamless></iframe>
        </div>
    </div>
</div>


<div class="modal inmodal" id="passwdUpdateModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated fadeIn">
            <div class="modal-header" style="height: 20px;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                <h4 class="modal-title" style="font-size: 22px;">修改密码</h4>
            </div>
            <div class="modal-body">
                <form id="updatePasswordForm" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">旧密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="oldPassword" id="oldPassword" required="" minlength="2"
                                   class="form-control" placeholder="旧密码">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">新密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="newPassword" id="newPassword" required="" minlength="2"
                                   class="form-control" placeholder="新密码">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">确认密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="newPasswordConfirm" id="newPasswordConfirm" required=""
                                   minlength="2" class="form-control" placeholder="确认密码">
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


<div class="modal inmodal" id="updateImageModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated fadeIn">
            <div class="modal-header" style="height: 20px;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                <h4 class="modal-title" style="font-size: 22px;">修改头像</h4>
            </div>
            <div class="modal-body">
                <form id="updateImageForm" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">头像图片</label>
                        <div class="col-sm-8">
                            <div id="file" class="dropzone" style="display: none"></div>
                            <div id="addBannerPic" height="80" width="100">
                            </div>
                            <a id="addUploadPicBtn">Upload</a>
                            <input type="hidden" name="image" id="addBannerUrl" required="">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" id="btnSaveUpdateImage"  class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>


</body>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/metisMenu/jquery.metisMenu.js"></script>
<script src="/js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/js/layer/layer.min.js"></script>
<script src="/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="/js/contabs.min.js"></script>
<script src="/js/contabs.min.js"></script>
<script src="/js/common.js"></script>
<script src="/js/dropzone/dropzone.js"></script>
<script src="/js/sweetalert/sweetalert.min.js"></script>

<script>
    Dropzone.autoDiscover = false;
    var addBannerDropz;
    addBannerDropz = new dropzoneImgInit("/", "#file", "#addBannerPic", "#addBannerUrl", 'width="300px"');
    $("#addUploadPicBtn").on("click", function () {
        addBannerDropz.removeAllFiles();
        addBannerDropz.options.url = "/user/upload";
        addBannerDropz.hiddenFileInput.click();
    });

    function updatePassword() {
        $("#passwdUpdateModal").modal();
    }

    function updateImage() {
        $("#updateImageModal").modal();
    }


    $("#btnSaveUpdate").on("click", function () {
        post("/user/updatePasswd", $("#updatePasswordForm").serialize(), function (result) {
            swal({title: "提示", text: "操作成功", type: 'success'}, function () {
                $("#passwdUpdateModal").modal("hide");
            });
        });
    })
    $("#btnSaveUpdateImage").click(function () {
        post("/user/updateImage", $("#updateImageForm").serialize(), function (result) {
            swal({title: "提示", text: "操作成功", type: 'success'}, function () {
                $("#updateImage").attr("src", result.data);
                $("#updateImageModal").modal('hide');
            });
        });
    });
</script>

</html>