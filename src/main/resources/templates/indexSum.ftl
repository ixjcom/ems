<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/css/layui.css" media="all">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;"></fieldset>

<ul class="layui-timeline">
    <#list notifys as e>
        <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
                <h3 class="layui-timeline-title">${e.releaseTime?string("yyyy年MM月dd日 HH:mm:ss")}</h3>
                <fieldset class="layui-elem-field">
                    <legend>${e.title}</legend>
                    <div class="layui-field-box">
                        ${e.content}
                        <br/>
                        <p style="float: right">发布人:${e.releaseUser}</p>
                    </div>
                </fieldset>
            </div>
        </li>
    </#list>
</ul>


<script src="/js/layui.js" charset="utf-8"></script>
<script>
</script>

</body>
</html>