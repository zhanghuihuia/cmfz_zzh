<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function () {
        $("#showUser").edatagrid({
            url:'${pageContext.request.contextPath}/user/queryAll',
            pagination: true,
            pageList: [2, 5, 10, 15, 20],
            pageSize: 5,
            fitColumns:true,
            columns: [[
                {title: "用户编号", field: "id", width: 230},
                {title: "手机号", field: "phoneNum", width: 150},
                {title: "用户名称", field: "name", width: 150},
                {title: "用户密码", field: "password", width: 150},
                {title: "用户省份", field: "province", width: 150},
                {title: "用户城市", field: "city", width: 150},
                {title: "用户法名", field: "nickName", width: 150},
                {title: "用户性别", field: "sex", width: 150},
                {title: "用户签名", field: "sign", width: 150},
                {title: "用户状态", field: "status", width: 150}
            ]],
            toolbar: [{
                iconCls: 'icon-cancel',
                text:'封禁用户',
                handler: function(){
                    var select = $("#showUser").edatagrid("getSelected");
                    if(select == null){
                        $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                    }else if(select.status=="已封禁"){
                        $.messager.show({title:'温馨提示',msg:'该用户已为禁用状态！'});
                    }else{
                        del(select.id);
                    }
                }
            },{
            iconCls: 'icon-ok',
                text:'解封用户',
                handler: function(){
                var select = $("#showUser").edatagrid("getSelected");

                if(select == null){
                    $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                }else if(select.status=="正常使用"){
                    $.messager.show({title:'温馨提示',msg:'该用户已为正常使用状态！'});
                }else{
                    sy(select.id);
                }
            }
        }],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.headPic + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>nackName: ' + rowData.nickName + '</p>' +
                    '<p>Status: ' + rowData.status + '</p>' +
                    '<p>sign: ' + rowData.sign + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });
    });
    /*禁用*/
    function del(id) {
        $.messager.confirm('确认封禁','您确认封禁此用户?',function(r) {
            if(r){
                $.post("${pageContext.request.contextPath}/user/disable",{"id":id},function (result) {
                    if(result.success){
                        $.messager.show({title:'温馨提示',msg:'该用户已被禁用！'});
                    }else{
                        $.messager.show({title:'温馨提示',msg:result.msg});
                    }
                    $("#showUser").edatagrid("reload");
                });
            }
        });
    }
    /*解封*/
    function sy(id) {
        $.messager.confirm('确认解封','您确认解封此用户?',function(r) {
            if(r){
                $.post("${pageContext.request.contextPath}/user/unset",{"id":id},function (result) {
                    if(result.success){
                        $.messager.show({title:'温馨提示',msg:'该用户已被解封！'});
                    }else{
                        $.messager.show({title:'温馨提示',msg:result.msg});
                    }
                    $("#showUser").edatagrid("reload");
                });
            }
        });
    }

</script>
<table id="showUser" class="easyui-dategrid" data-options="fit:true"></table>
<div id="duser"></div>