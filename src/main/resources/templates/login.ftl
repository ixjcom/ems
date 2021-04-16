<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>ems</title>
    <!--用百度的静态资源库的cdn安装bootstrap环境-->
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!--font-awesome 核心我CSS 文件-->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- 在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="/image/favicon.ico">
    <!--jquery.validate-->
    <style type="text/css">
        body {
            background: url(/image/6.png);
            background-size: 100% 100%;
            background-attachment: fixed
        }

        .form {
            background: rgba(255, 255, 255, 0.2);
            width: 600px;
            margin: 250px auto;
        }

        #login_form {
            display: block;
        }

        #register_form {
            display: none;
        }

        .fa {
            display: inline-block;
            top: 27px;
            left: 6px;
            position: relative;
            color: #ccc;
        }

        input[type="text"],
        input[type="password"] {
            padding-left: 26px;
        }

        .checkbox {
            padding-left: 21px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form row">
        <div class="col-sm-6 col-md-6">
            <img src="/image/7.png" width="100%"/>
        </div>
        <div class="col-sm-6 col-md-6" style="margin-top: 2%;">
            <span style="width: 100%;color: white;font-size: 30px;margin-left: 15%;">河南光明银行</span>
            <hr style="width: 100%;background-color: white;margin: 0;"/>
            <span style="width: 100%;color: white;margin-left: 10%;">GUANG MING BANK OF HENAN</span>
            <form class="m-t" role="form" action="login-auth" method="post">
                <div class="col-sm-12 col-md-12">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Username" name="username" autofocus="autofocus"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <input class="form-control required" type="password" placeholder="Password" id="register_password" name="password"/>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-success form-control" value="Sign Up "/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>


<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</html>
