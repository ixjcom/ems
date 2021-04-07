$(document).ready(function () {
    $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",});
    $("#btnCancel").on("click", function () {
        $("#roleSearchForm")[0].reset();
    });
    $("#btnSearch").on("click", function () {
        $("#pageNo").val(1);
        $("#pageSize").val(10);
        searchRoleList();
    });
    $("#btnSaveUpdate").on("click",function () {
        saveRoleUpdate();
    });

    searchRoleList();
    pageFunInit(function () {
        searchRoleList();
    });
});

//查询角色列表
function searchRoleList() {
    post(_rootPath+"adminRole/search-list",$("#roleSearchForm").serialize(),function (result) {
        $("#roleTbody").setTemplateElement("roleTr-template", null, {filter_data: false});
        $("#roleTbody").processTemplate(result);
        $("#rolePageDiv").setTemplateElement("pager_template");
        $("#rolePageDiv").processTemplate(result);
        $(".btnRoleDetail").on("click",function () {
            var roleId = $(this).attr("roleId");
            searchRoleDetail(roleId);
        });
        $(".btnRoleDelete").on("click",function () {
            var roleId = $(this).attr("roleId");
            deleteRole(roleId);
        });

    });
}

//角色详情
function searchRoleDetail(roleId) {
    post(_rootPath+"adminRole/search-detail",{"roleId":roleId},function (result) {
        $("#roleName").val(result.data.name);
        $("#roleId").val(roleId);
        $("input[name='permissionIds']").each(function (index,item) {
            $(item).parent().removeClass("checked");
            var val = $(item).val();
            $(result.data.permissionIds).each(function (index,permissionId) {
                if(val==permissionId){
                    $(item).prop("checked",true);
                    $(item).parent().addClass("checked");
                }
            });
        });
        $("#modalRoleDetail").modal();
    });
}

//保存角色修改
function saveRoleUpdate(){
    post(_rootPath+"adminRole/update",$("#roleDetailForm").serialize(),function (result) {
        $("#modalRoleDetail").modal("hide");
        window.location.reload();
    });
}

//删除角色
function deleteRole(roleId) {

    swal({
        title: "确定删除选中的记录?",
        text: "删除之后无法恢复该数据!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "确定",
        closeOnConfirm: false
    },function(){
        post(_rootPath+"adminRole/delete",{"roleId":roleId},function (result) {
            swal({title:"删除成功",type:"success"});
            searchRoleList();
        });
    });


}
