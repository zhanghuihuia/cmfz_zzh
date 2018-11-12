<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function () {
        $("#showBanner").edatagrid({
            url:'${pageContext.request.contextPath}/banner/queryAll',
            pagination: true,
            pageList: [2, 5, 10, 15, 20],
            pageSize: 5,
            fitColumns:true,
            columns: [[
                {title: "轮播图编号", field: "id", width: 230},
                {title: "轮播图标题", field: "title", width: 150},
                {title: "轮播图地址", field: "imgPath", width: 150},
                {title: "描述", field: "description", width: 150},
                {title: "状态", field: "status", width: 200},
                {title: "创建时间", field: "createDate", width: 200},
                /*{
                    "title": "操作", "field": "options", width: 200,
                    "formatter": function (value, row, index) {
                        return "<a href='javascript:;' class='anniu' onclick=\"del('" + row.id + "');\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;" +
                            "<a href='javascript:;' class='anniu' onclick=\"upd('" + row.id + "');\" data-options=\"iconCls:'icon-edit',plain:true\">更新</a>"
                    }
                }*/,
            ]],
            /*onLoadSuccess:function () {
                $(".anniu").linkbutton({"width":60});
            },*/
            toolbar: [{
                iconCls: 'icon-add',
                text:'增加轮播图',
                handler: function(){
                    $("#dd").dialog({
                        href:"${pageContext.request.contextPath}/back/banner/addBanner.jsp",
                        title:'轮播图添加',
                        draggable:false,
                        iconCls:'icon-add',
                        width:400,
                        height:350,
                        buttons:[{
                            text:'保存',
                            iconCls:'icon-save',
                            handler:function(){
                                $("#addBannerForm").form("submit",{
                                    url:'${pageContext.request.contextPath}/banner/save',
                                    success:function (result) {
                                        var parseJSON = $.parseJSON(result);
                                        if(parseJSON.success){
                                            $.messager.show({title:'温馨提示',msg:'轮播图添加成功！'});
                                        }else{
                                            $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                                        }
                                        $("#dd").dialog("close");
                                        $("#showBanner").edatagrid("reload");
                                    }
                                });
                            }
                        },{
                            text:'关闭',
                            iconCls:'icon-cancel',
                            handler:function(){
                                $("#dd").dialog("close");
                            }
                        }]
                    });
                }
            },{
                iconCls: 'icon-edit',
                text:'修改轮播图',
                handler: function(){
                    var select = $("#showBanner").edatagrid("getSelected");
                    if(select == null){
                        $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                    }else{
                        upd(select.id);
                    }
                }
            },{
                iconCls: 'icon-remove',
                text:'删除轮播图',
                handler: function(){
                    var select = $("#showBanner").edatagrid("getSelected");
                    if(select == null){
                        $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                    }else{
                        del(select.id);
                    }
                }
            }],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.createDate + '</p>' +
                    '<p>Status: ' + rowData.status + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });
    });
    /*删除方法*/
    function del(id) {
        $.post("${pageContext.request.contextPath}/banner/delete",{"id":id},function (result) {
            if(result.success){
                $.messager.show({title:'温馨提示',msg:'删除成功！'});
            }else{
                $.messager.show({title:'温馨提示',msg:result.msg});
            }
            $("#showBanner").edatagrid("reload");
        });
    }
    /*更新方法*/
    function upd(id) {
        $("#dd").dialog({
            href:"${pageContext.request.contextPath}/back/banner/updateBanner.jsp?id="+id,
            title:'轮播图更新',
            draggable:false,
            iconCls:'icon-edit',
            width:400,
            height:350,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#updateBannerForm").form("submit",{
                        url:'${pageContext.request.contextPath}/banner/update',
                        success:function (result) {
                            var parseJSON = $.parseJSON(result);
                            if(parseJSON.success){
                                $.messager.show({title:'温馨提示',msg:'轮播图修改成功！'});
                            }else{
                                $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                            }
                            $("#dd").dialog("close");
                            $("#showBanner").edatagrid("reload");
                        }
                    });
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#dd").dialog("close");
                }
            }]

        });
    }
</script>
<table id="showBanner" class="easyui-dategrid" data-options="fit:true"></table>
<div id="dd"></div>