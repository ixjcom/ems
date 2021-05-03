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
    $("#addUser").on("click",function () {
        $("#UserAddForm")[0].reset();
        $("#UserAdd").modal();
    });
    $("#btnAddUser").on("click",function () {
    	 $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
		 if($("#UserAddForm").valid()){
	        post("/salary/insert",$("#UserAddForm").serialize(),function (result) {
	            $("#UserAdd").modal('hide');
	            searchUserList();
	        });
	     }
    });
});

function searchUserList() {
    post("/salary/select",$("#UserSearchForm").serialize(),function (result) {
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
    post("/salary/search-detail",{"id":id},function (result) {
    		$("#saveId").val(result.data.id);
    		$("#saveRoleId").val(result.data.roleId);
    		$("#saveSalary").val(result.data.salary);
    		$("#saveCreateTime").val(new Date(result.data.createTime).Format("yyyy-MM-dd"));
    		$("#saveUpdateTime").val(new Date(result.data.updateTime).Format("yyyy-MM-dd"));
        $("#UserDetail").modal();
    });
}


//删除
function deletePrimaryKeyId(id) {
    post("/salary/delete",{"id":id},function (result) {
       searchUserList();
    });
}


//保存修改
function saveUpdate(){
	 $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
	if($("#UserDetailForm").valid()){
	    post("/salary/update",$("#UserDetailForm").serialize(),function (result) {
	        $("#UserDetail").modal("hide");
	        searchUserList();
	    });
    }
}

