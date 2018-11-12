<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function () {
        $("#showArticle").edatagrid({
            url:'${pageContext.request.contextPath}/article/queryAll',
            pagination: true,
            pageList: [2, 5, 10, 15, 20],
            pageSize: 5,
            fitColumns:true,
            columns: [[
                {title: "文章编号", field: "id", width: 230},
                {title: "文章标题", field: "title", width: 150},
                /*{title: "作者名称", field: "guru.name", width: 150},*/
                {title: "发布日期", field: "publishDate", width: 150},
                {title: "插图地址", field: "imgPath", width: 150},
                {title: "文章内容", field: "content", width: 200}
            ]],
            toolbar: [{
                iconCls: 'icon-add',
                text:'增加文章',
                handler: function(){
                    $("#darticle").dialog({
                        href:"${pageContext.request.contextPath}/back/article/addArticle.jsp",
                        title:'文章添加',
                        draggable:false,
                        iconCls:'icon-add',
                        width:400,
                        height:350,
                        buttons:[{
                            text:'保存',
                            iconCls:'icon-save',
                            handler:function(){
                                $("#addArticleForm").form("submit",{
                                    url:'${pageContext.request.contextPath}/article/save',
                                    success:function (result) {
                                        var parseJSON = $.parseJSON(result);
                                        if(parseJSON.success){
                                            $.messager.show({title:'温馨提示',msg:'文章添加成功！'});
                                        }else{
                                            $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                                        }
                                        $("#darticle").dialog("close");
                                        $("#showArticle").edatagrid("reload");
                                    }
                                });
                            }
                        },{
                            text:'关闭',
                            iconCls:'icon-cancel',
                            handler:function(){
                                $("#darticle").dialog("close");
                            }
                        }]
                    });
                }
            },{
                iconCls: 'icon-edit',
                text:'修改文章',
                handler: function(){
                    var select = $("#showArticle").edatagrid("getSelected");
                    if(select == null){
                        $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                    }else{
                        upd(select.id);
                    }
                }
            },{
                iconCls: 'icon-remove',
                text:'删除文章',
                handler: function(){
                    var select = $("#showArticle").edatagrid("getSelected");
                    if(select == null){
                        $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                    }else{
                        $.messager.confirm('确认删除','您确认删除此文章?',function(r) {
                            if(r) {
                                del(select.id);
                            }
                        });
                    }
                }
            }],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.publishDate + '</p>' +
                    '<p>author: ' + rowData.guru.name + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });
    });
    /*删除方法*/
    function del(id) {
        $.post("${pageContext.request.contextPath}/article/delete",{"id":id},function (result) {
            if(result.success){
                $.messager.show({title:'温馨提示',msg:'删除成功！'});
            }else{
                $.messager.show({title:'温馨提示',msg:result.msg});
            }
            $("#showArticle").edatagrid("reload");
        });
    }
    /*更新方法*/
    function upd(id) {
        $("#darticle").dialog({
            href:"${pageContext.request.contextPath}/back/article/updateArticle.jsp?id="+id,
            title:'文章更新',
            draggable:false,
            iconCls:'icon-edit',
            width:400,
            height:350,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#updateBannerForm").form("submit",{
                        url:'${pageContext.request.contextPath}/article/update',
                        success:function (result) {
                            var parseJSON = $.parseJSON(result);
                            if(parseJSON.success){
                                $.messager.show({title:'温馨提示',msg:'文章修改成功！'});
                            }else{
                                $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                            }
                            $("#darticle").dialog("close");
                            $("#showArticle").edatagrid("reload");
                        }
                    });
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#darticle").dialog("close");
                }
            }]

        });
    }
</script>
<table id="showArticle" class="easyui-dategrid" data-options="fit:true"></table>
<div id="darticle"></div>