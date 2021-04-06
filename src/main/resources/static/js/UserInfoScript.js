$(document).ready(function () {
    $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});

    $("#UserInfoBtnSearch").on("click", function () {
    	$("pageNum").val(1);
		$("pageSize").val(10);
        searchUserInfoList();
    });
    $("#UserInfoBtnCancel").on("click",function () {
        $("#UserInfoSearchForm")[0].reset();
    });
    
    $("#btnSaveUpdate").on("click",function () {
    	saveUpdate();
    });
    searchUserInfoList();
    pageFunInit(function () {
        searchUserInfoList();
    });

   	var startUpdateTime = {
        elem: "#startUpdateTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    var endUpdateTime = {
        elem: "#endUpdateTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    
    var saveUpdateTime={
        elem: "#saveUpdateTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    var addUpdateTime={
        elem: "#addUpdateTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    laydate(startUpdateTime);
    laydate(endUpdateTime);
    laydate(saveUpdateTime);
    laydate(addUpdateTime);

    $("#addUserInfo").on("click",function () {
        $("#UserInfoAddForm")[0].reset();
        $("#UserInfoAdd").modal();
    });
    $("#btnAddUserInfo").on("click",function () {
    	 $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
		 if($("#UserInfoAddForm").valid()){
	        post(_rootPath+"userinfo/insert",$("#UserInfoAddForm").serialize(),function (result) {
	            $("#UserInfoAdd").modal('hide');
	            searchUserInfoList();
	        });
	     }
    });
});

function searchUserInfoList() {
    post(_rootPath+"userinfo/select",$("#UserInfoSearchForm").serialize(),function (result) {
        $("#UserInfoTbody").setTemplateElement("UserInfoTr-template", null, {filter_data: false});
        $("#UserInfoTbody").processTemplate(result);

        $("#UserInfoPageDiv").setTemplateElement("pager_template", null, {filter_data: false});
        $("#UserInfoPageDiv").processTemplate(result);
		$(".btnUserInfoDetail").on("click",function () {
            var id = $(this).attr("primaryKeyId");
            searchUserInfoDetail(id);
        });
        $(".btnUserInfoDelete").on("click",function () {
            var id = $(this).attr("primaryKeyId");
            deletePrimaryKeyId(id);
        });

    });
}

//详情
function searchUserInfoDetail(id) {
    post(_rootPath+"userinfo/search-detail",{"id":id},function (result) {
    		$("#saveId").val(result.data.id);
    		$("#saveUserId").val(result.data.userId);
    		$("#savePostType").val(result.data.postType);
    		$("#saveLoginCount").val(result.data.loginCount);
    		$("#saveLoginIp").val(result.data.loginIp);
    		$("#saveUpdateTime").val(new Date(result.data.updateTime).Format("yyyy-MM-dd"));
        $("#UserInfoDetail").modal();
    });
}


//删除
function deletePrimaryKeyId(id) {
    post(_rootPath+"userinfo/delete",{"id":id},function (result) {
       searchUserInfoList();
    });
}


//保存修改
function saveUpdate(){
	 $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
	if($("#UserInfoDetailForm").valid()){
	    post(_rootPath+"userinfo/update",$("#UserInfoDetailForm").serialize(),function (result) {
	        $("#UserInfoDetail").modal("hide");
	        searchUserInfoList();
	    });
    }
}

