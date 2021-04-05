$(document).ready(function () {
    $("#UserBtnSearch").on("click", function () {
    	$("#pageNo").val(1);
		$("#pageSize").val(10);
        searchUserList();
    });
    $("#UserBtnCancel").on("click",function () {
        $("#UserSearchForm")[0].reset();
    });
    
    $("#btnSaveUpdate").on("click",function () {
    	saveUpdate();
    });
    searchUserList();
    pageFunInit(function () {
        searchUserList();
    });

   	var startCreateTime = {
        elem: "#startCreateTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    var endCreateTime = {
        elem: "#endCreateTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    
    var saveCreateTime={
        elem: "#saveCreateTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    var addCreateTime={
        elem: "#addCreateTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    laydate(startCreateTime);
    laydate(endCreateTime);
    laydate(saveCreateTime);
    laydate(addCreateTime);
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

    $("#addUser").on("click",function () {
        $("#UserAddForm")[0].reset();
        $("#UserAdd").modal();
    });
    $("#btnAddUser").on("click",function () {
    	 $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
		 if($("#UserAddForm").valid()){
	        post(_rootPath+"user/insert",$("#UserAddForm").serialize(),function (result) {
	            $("#UserAdd").modal('hide');
	            searchUserList();
	        });
	     }
    });
});

function searchUserList() {
    post(_rootPath+"user/select",$("#UserSearchForm").serialize(),function (result) {
        $("#UserTbody").setTemplateElement("UserTr-template", null, {filter_data: false});
        $("#UserTbody").processTemplate(result);

        $("#UserPageDiv").setTemplateElement("pager_template", null, {filter_data: false});
        $("#UserPageDiv").processTemplate(result);
		$(".btnUserDetail").on("click",function () {
            var id = $(this).attr("primaryKeyId");
            searchUserDetail(id);
        });
        $(".btnUserDelete").on("click",function () {
            var id = $(this).attr("primaryKeyId");
            deletePrimaryKeyId(id);
        });

    });
}

//详情
function searchUserDetail(id) {
    post(_rootPath+"user/search-detail",{"id":id},function (result) {
    		$("#saveId").val(result.data.id);
    		$("#saveUserName").val(result.data.userName);
    		$("#savePassword").val(result.data.password);
    		$("#saveMobil").val(result.data.mobil);
    		$("#saveCreateTime").val(new Date(result.data.createTime).Format("yyyy-MM-dd"));
    		$("#saveUpdateTime").val(new Date(result.data.updateTime).Format("yyyy-MM-dd"));
        $("#UserDetail").modal();
    });
}


//删除
function deletePrimaryKeyId(id) {
    post(_rootPath+"user/delete",{"id":id},function (result) {
       searchUserList();
    });
}


//保存修改
function saveUpdate(){
	 $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
	if($("#UserDetailForm").valid()){
	    post(_rootPath+"user/update",$("#UserDetailForm").serialize(),function (result) {
	        $("#UserDetail").modal("hide");
	        searchUserList();
	    });
    }
}

