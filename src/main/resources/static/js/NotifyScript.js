$(document).ready(function () {
    $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});

    $("#NotifyBtnSearch").on("click", function () {
    	$("pageNum").val(1);
		$("pageSize").val(10);
        searchNotifyList();
    });
    $("#NotifyBtnCancel").on("click",function () {
        $("#NotifySearchForm")[0].reset();
    });
    
    $("#btnSaveUpdate").on("click",function () {
    	saveUpdate();
    });
    searchNotifyList();
    pageFunInit(function () {
        searchNotifyList();
    });

   	var startReleaseTime = {
        elem: "#startReleaseTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    var endReleaseTime = {
        elem: "#endReleaseTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    
    var saveReleaseTime={
        elem: "#saveReleaseTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    var addReleaseTime={
        elem: "#addReleaseTime",
        format: "YYYY-MM-DD",
        max: "2099-06-16",
        istime: true,
        istoday: true
    };
    laydate(startReleaseTime);
    laydate(endReleaseTime);
    laydate(saveReleaseTime);
    laydate(addReleaseTime);

    $("#addNotify").on("click",function () {
        $("#NotifyAddForm")[0].reset();
        $("#NotifyAdd").modal();
    });
    $("#btnAddNotify").on("click",function () {
    	 $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
		 if($("#NotifyAddForm").valid()){
	        post(_rootPath+"notify/insert",$("#NotifyAddForm").serialize(),function (result) {
	            $("#NotifyAdd").modal('hide');
	            searchNotifyList();
	        });
	     }
    });
});

function searchNotifyList() {
    post(_rootPath+"notify/select",$("#NotifySearchForm").serialize(),function (result) {
        $("#NotifyTbody").setTemplateElement("NotifyTr-template", null, {filter_data: false});
        $("#NotifyTbody").processTemplate(result);

        $("#NotifyPageDiv").setTemplateElement("pager_template", null, {filter_data: false});
        $("#NotifyPageDiv").processTemplate(result);
		$(".btnNotifyDetail").on("click",function () {
            var id = $(this).attr("primaryKeyId");
            searchNotifyDetail(id);
        });
        $(".btnNotifyDelete").on("click",function () {
            var id = $(this).attr("primaryKeyId");
            deletePrimaryKeyId(id);
        });

    });
}

//详情
function searchNotifyDetail(id) {
    post(_rootPath+"notify/search-detail",{"id":id},function (result) {
    		$("#saveId").val(result.data.id);
    		$("#saveTitle").val(result.data.title);
    		$("#saveReleaseTime").val(new Date(result.data.releaseTime).Format("yyyy-MM-dd"));
    		$("#saveReleaseUser").val(result.data.releaseUser);
    		$("#saveReleaseUserId").val(result.data.releaseUserId);
    		$("#saveIsShow").val(result.data.isShow);
    		$("#saveContent").val(result.data.content);
        $("#NotifyDetail").modal();
    });
}


//删除
function deletePrimaryKeyId(id) {
    post(_rootPath+"notify/delete",{"id":id},function (result) {
       searchNotifyList();
    });
}


//保存修改
function saveUpdate(){
	 $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
	if($("#NotifyDetailForm").valid()){
	    post(_rootPath+"notify/update",$("#NotifyDetailForm").serialize(),function (result) {
	        $("#NotifyDetail").modal("hide");
	        searchNotifyList();
	    });
    }
}

