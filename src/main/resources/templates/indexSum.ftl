<!DOCTYPE html>
<html>
<head>
    <title>通知</title>
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
<body>











CREATE TABLE `tb_business` (
`id` bigint NOT NULL AUTO_INCREMENT,
`user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
`password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
`mobil` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
`create_time` datetime DEFAULT NULL,
`update_time` datetime DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

CREATE TABLE `tb_notify` (
`id` bigint NOT NULL AUTO_INCREMENT,
`title` varchar(255) DEFAULT NULL COMMENT '标题',
`release_time` datetime DEFAULT NULL COMMENT '发布时间',
`release_user` varchar(255) DEFAULT NULL COMMENT '发布人',
`is_show` int DEFAULT NULL COMMENT '0不显示1显示',
`content` longtext COMMENT '内容',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

CREATE TABLE `tb_user_info` (
`id` bigint NOT NULL AUTO_INCREMENT,
`user_id` bigint DEFAULT NULL,
`post__type` int DEFAULT NULL COMMENT '职务类型',
`login_count` int DEFAULT NULL COMMENT '登陆次数',
`login_ip` varchar(20) DEFAULT NULL COMMENT 'ip',
`update_time` datetime DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

CREATE TABLE `tb_user` (
`id` bigint NOT NULL AUTO_INCREMENT,
`user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
`password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
`mobil` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
`create_time` datetime DEFAULT NULL,
`update_time` datetime DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;






















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
</body>

</html>
