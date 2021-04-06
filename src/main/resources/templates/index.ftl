<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ems</title>
    <link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">
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

                <li>
                    <a href="#">
                        <i class="fa fa-cogs"></i>
                        <span class="nav-label">数据统计</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a href="/user/to-list" class="J_menuItem">业务信息排名</a></li>
                    </ul>
                </li>
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
                               <span class="block m-t-xs"><strong class="font-bold">刘云朋</strong></span>
                                <span class="text-muted text-xs block">操作<b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li class="divider"></li>
                            <li><a href="logout">loginOut</a>
                            <li><a href="javascript:updatePassword();">修改密码</a>
                            </li>
                        </ul>
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
                    <li class="J_tabShowActive"><a>关闭当前</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他</a>
                    </li>
                </ul>
            </div>
            <a href="logout" class="roll-nav roll-right J_tabExit" style="width: 120px"><i
                        class="fa fa fa-sign-out"></i>退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="/index/index_sum" frameborder="0" data-id="index_v1.html" seamless></iframe>
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
</html>