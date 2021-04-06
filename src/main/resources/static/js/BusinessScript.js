$(document).ready(function () {
    $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});

    $("#BusinessBtnSearch").on("click", function () {
    	$("pageNum").val(1);
		$("pageSize").val(10);
        searchBusinessList();
    });
    $("#BusinessBtnCancel").on("click",function () {
        $("#BusinessSearchForm")[0].reset();
    });
    
    $("#btnSaveUpdate").on("click",function () {
    	saveUpdate();
    });
    searchBusinessList();
    pageFunInit(function () {
        searchBusinessList();
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

    $("#addBusiness").on("click",function () {
        $("#BusinessAddForm")[0].reset();
        $("#BusinessAdd").modal();
    });
    $("#btnAddBusiness").on("click",function () {
    	 $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
		 if($("#BusinessAddForm").valid()){
	        post(_rootPath+"business/insert",$("#BusinessAddForm").serialize(),function (result) {
	            $("#BusinessAdd").modal('hide');
	            searchBusinessList();
	        });
	     }
    });
});

function searchBusinessList() {
    post(_rootPath+"business/select",$("#BusinessSearchForm").serialize(),function (result) {
        $("#BusinessTbody").setTemplateElement("BusinessTr-template", null, {filter_data: false});
        $("#BusinessTbody").processTemplate(result);

        $("#BusinessPageDiv").setTemplateElement("pager_template", null, {filter_data: false});
        $("#BusinessPageDiv").processTemplate(result);
		$(".btnBusinessDetail").on("click",function () {
            var id = $(this).attr("primaryKeyId");
            searchBusinessDetail(id);
        });
        $(".btnBusinessDelete").on("click",function () {
            var id = $(this).attr("primaryKeyId");
            deletePrimaryKeyId(id);
        });

    });
}

//详情
function searchBusinessDetail(id) {
    post(_rootPath+"business/search-detail",{"id":id},function (result) {
    		$("#saveId").val(result.data.id);
    		$("#saveUserId").val(result.data.userId);
    		$("#saveFraction").val(result.data.fraction);
    		$("#saveBusinessCount").val(result.data.businessCount);
    		$("#saveUpdateTime").val(new Date(result.data.updateTime).Format("yyyy-MM-dd"));
        $("#BusinessDetail").modal();
    });
}


//删除
function deletePrimaryKeyId(id) {
    post(_rootPath+"business/delete",{"id":id},function (result) {
       searchBusinessList();
    });
}


//保存修改
function saveUpdate(){
	 $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
	if($("#BusinessDetailForm").valid()){
	    post(_rootPath+"business/update",$("#BusinessDetailForm").serialize(),function (result) {
	        $("#BusinessDetail").modal("hide");
	        searchBusinessList();
	    });
    }
}

