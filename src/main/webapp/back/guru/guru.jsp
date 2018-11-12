<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#showGuru").edatagrid({
            url:'${pageContext.request.contextPath}/guru/queryAll',
            pagination: true,
            pageList: [2, 5, 10, 15, 20],
            pageSize: 5,
            fitColumns:true,
            columns: [[
                {title: "上师编号", field: "id", width: 230,editor:"{type:'validatebox',options:{required:true}}"},
                {title: "上师名称", field: "name", width: 200},
                {title: "上师头像", field: "headPic", width: 200},
                {title: "上师性别", field: "sex", width: 200},
                {title: "上师状态", field: "status", width: 150},
                /*{
                    "title": "操作", "field": "options", width: 200,
                    "formatter": function (value, row, index) {
                        return "<a href='javascript:;' class='anniu' onclick=\"del('" + row.id + "');\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;" +
                            "<a href='javascript:;' class='anniu' onclick=\"upd('" + row.id + "');\" data-options=\"iconCls:'icon-edit',plain:true\">更新</a>"
                    }
                },*/
            ]],
            onLoadSuccess:function () {
                $(".anniu").linkbutton({"width":60});
            },
            toolbar: [{
                iconCls: 'icon-add',
                text:'增加上师',
                handler: function(){
                    $("#dguru").dialog({
                        href:"${pageContext.request.contextPath}/back/guru/addGuru.jsp",
                        title:'添加上师',
                        draggable:false,
                        iconCls:'icon-add',
                        width:400,
                        height:350,
                        buttons:[{
                            text:'保存',
                            iconCls:'icon-save',
                            handler:function(){
                                $("#addGuruForm").form("submit",{
                                    url:'${pageContext.request.contextPath}/guru/save',
                                    success:function (result) {
                                        var parseJSON = $.parseJSON(result);
                                        if(parseJSON.success){
                                            $.messager.show({title:'温馨提示',msg:'上师添加成功！'});
                                        }else{
                                            $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                                        }
                                        $("#dguru").dialog("close");
                                        $("#showGuru").edatagrid("reload");
                                    }
                                });
                            }
                        },{
                            text:'关闭',
                            iconCls:'icon-cancel',
                            handler:function(){
                                $("#dguru").dialog("close");
                            }
                        }]
                    });
                }
            },{
                iconCls: 'icon-edit',
                text:'修改上师',
                handler: function(){
                    var select = $("#showGuru").edatagrid("getSelected");
                    if(select == null){
                        $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                    }else{
                        upd(select.id);
                    }
                }
            },{
                iconCls: 'icon-remove',
                text:'删除上师',
                handler: function(){
                    var select = $("#showGuru").edatagrid("getSelected");
                    if(select == null){
                        $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                    }else{
                        $.messager.confirm('确认删除','您确认删除所选的上师信息?',function(r) {
                            if(r){
                                del(select.id);
                            }
                        });
                    }
                }
            }],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.headPic + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.name + '</p>' +
                    '<p>Status: ' + rowData.status + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });
    });
    /*删除方法*/
    function del(id) {
        $.post("${pageContext.request.contextPath}/guru/delete",{"id":id},function (result) {
            if(result.success){
                $.messager.show({title:'温馨提示',msg:'上师删除成功！'});
            }else{
                $.messager.show({title:'温馨提示',msg:result.msg});
            }
            $("#showGuru").edatagrid("reload");
        });
    }
    /*更新方法*/
    function upd(id) {
        $("#dguru").dialog({
            href:"${pageContext.request.contextPath}/back/guru/updateGuru.jsp?id="+id,
            title:'更新上师信息',
            draggable:false,
            iconCls:'icon-edit',
            width:400,
            height:350,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#updateGuruForm").form("submit",{
                        url:'${pageContext.request.contextPath}/guru/update',
                        success:function (result) {
                            var parseJSON = $.parseJSON(result);
                            if(parseJSON.success){
                                $.messager.show({title:'温馨提示',msg:'上师信息修改成功！'});
                            }else{
                                $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                            }
                            $("#dguru").dialog("close");
                            $("#showGuru").edatagrid("reload");
                        }
                    });
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#dguru").dialog("close");
                }
            }]

        });
    }
</script>
<table id="showGuru" class="easyui-dategrid" data-options="fit:true"></table>
<div id="dguru"></div>