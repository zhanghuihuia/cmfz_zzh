<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function () {
        $("#showAlbum").treegrid({
            url:'${pageContext.request.contextPath}/album/queryAll',
            idField:'id',
            treeField:'title',
            lines:true,
            fit:true,
            pagination: true,
            pageList: [2, 5, 10, 15, 20],
            pageSize: 5,
            fitColumns:true,
            columns:[[
                {title:'名称',field:'title',width:180},
                {field:'downPath',title:'下载路径',width:180},
                {field:'size',title:'章节大小',width:180},
                {field:'duration',title:'章节时长',width:180}
            ]],
            toolbar: [
                {
                    iconCls: 'icon-tip',
                    text:'专辑详情',
                    handler: function(){
                        var roots = $("#showAlbum").treegrid("getRoots");
                        var select = $("#showAlbum").edatagrid("getSelected");
                        if(select == null){
                            $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                        }else{
                            var index = $.inArray(select,roots);
                            if(index!=-1){
                                show(select.id);
                            }else{
                                $.messager.show({title:'温馨提示',msg:'请选择专辑！'});
                            }
                        }
                    }
                },{
                    iconCls: 'icon-add',
                    text:'增加专辑',
                    handler: function(){
                        $("#dalbum").dialog({
                            href:"${pageContext.request.contextPath}/back/album/addAlbum.jsp",
                            title:'专辑添加',
                            draggable:false,
                            iconCls:'icon-add',
                            width:400,
                            height:410,
                            buttons:[{
                                text:'保存',
                                iconCls:'icon-save',
                                handler:function(){
                                    $("#addAlbumForm").form("submit",{
                                        url:'${pageContext.request.contextPath}/album/save',
                                        success:function (result) {
                                            var parseJSON = $.parseJSON(result);
                                            if(parseJSON.success){
                                                $.messager.show({title:'温馨提示',msg:'专辑添加成功！'});
                                            }else{
                                                $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                                            }
                                            $("#dalbum").dialog("close");
                                            $("#showAlbum").treegrid("reload");
                                        }
                                    });
                                }
                            },{
                                text:'关闭',
                                iconCls:'icon-cancel',
                                handler:function(){
                                    $("#dalbum").dialog("close");
                                }
                            }]
                        });
                    }
                },{
                    iconCls: 'icon-save',
                    text:'增加章节',
                    handler: function(){
                        var roots = $("#showAlbum").treegrid("getRoots");
                        var select = $("#showAlbum").edatagrid("getSelected");
                        if(select == null){
                            $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                        }else{
                            var index = $.inArray(select,roots);
                            if(index!=-1){
                                $("#dalbum").dialog({
                                    href:"${pageContext.request.contextPath}/back/album/addChapter.jsp?id="+select.id,
                                    title:'章节添加',
                                    draggable:false,
                                    iconCls:'icon-add',
                                    width:400,
                                    height:410,
                                    buttons:[{
                                        text:'保存',
                                        iconCls:'icon-save',
                                        handler:function(){
                                            addChapter()
                                        }
                                    },{
                                        text:'关闭',
                                        iconCls:'icon-cancel',
                                        handler:function(){
                                            $("#dalbum").dialog("close");
                                        }
                                    }]
                                });
                            }else{
                                $.messager.show({title:'温馨提示',msg:'请选择专辑！'});
                            }
                        }
                    }
                },{
                    iconCls: 'icon-undo',
                    text:'下载音频',
                    handler: function(){
                        var roots = $("#showAlbum").treegrid("getRoots");
                        var select = $("#showAlbum").edatagrid("getSelected");
                        if(select == null){
                            $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                        }else{
                            var index = $.inArray(select,roots);
                            if(index==-1){
                                location.href="${pageContext.request.contextPath }/chapter/download?fileName="+select.downPath+"&openStyle=attachment";
                            }else{
                                $.messager.show({title:'温馨提示',msg:'请选择章节！'});
                            }
                        }
                    }
                },{
                iconCls: 'icon-edit',
                text:'修改专辑',
                handler: function(){
                    var roots = $("#showAlbum").treegrid("getRoots");
                    var select = $("#showAlbum").edatagrid("getSelected");
                    if(select == null){
                        $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                    }else{
                        var index = $.inArray(select,roots);
                        if(index!=-1){
                            upd(select.id);
                        }else{
                            $.messager.show({title:'温馨提示',msg:'请选择专辑！'});
                        }
                    }
                }
            },{
                iconCls: 'icon-remove',
                text:'删除专辑',
                handler: function(){
                    var roots = $("#showAlbum").treegrid("getRoots");
                    var select = $("#showAlbum").edatagrid("getSelected");
                    if(select == null){
                        $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                    }else{
                        var index = $.inArray(select,roots);
                        if(index!=-1){
                            $.messager.confirm('确认删除','您确认删除此用户?',function(r) {
                                if(r) {
                                    del(select.id);
                                }
                            });
                        }else{
                            $.messager.show({title:'温馨提示',msg:'请选择专辑！'});
                        }
                    }
                }
            }],
        });
    });
    /*删除方法*/
    function del(id) {
        $.post("${pageContext.request.contextPath}/album/delete",{"id":id},function (result) {
            if(result.success){
                $.messager.show({title:'温馨提示',msg:'删除成功！'});
            }else{
                $.messager.show({title:'温馨提示',msg:result.msg});
            }
            $("#showAlbum").treegrid("reload");
        });
    }
    /*展示方法*/
    function show(id) {
        $("#dalbum").dialog({
            href:"${pageContext.request.contextPath}/back/album/showAlbum.jsp?id="+id,
            title:'专辑展示',
            draggable:false,
            iconCls:'icon-edit',
            width:600,
            height:430,
            buttons:[{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#dalbum").dialog("close");
                }
            }]
        });
    }
    /*章节添加*/
    function addChapter() {
        $("#addChapterForm").form("submit",{
            url:'${pageContext.request.contextPath}/chapter/save',
            success:function (result) {
                var parseJSON = $.parseJSON(result);
                if(parseJSON.success){
                    $.messager.show({title:'温馨提示',msg:'章节添加成功！'});
                }else{
                    $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                }
                $("#dalbum").dialog("close");
                $("#showAlbum").treegrid("reload");
            }
        });
    }
    /*更新方法*/
    function upd(id) {
        $("#dalbum").dialog({
            href:"${pageContext.request.contextPath}/back/album/updateAlbum.jsp?id="+id,
            title:'专辑更新',
            draggable:false,
            iconCls:'icon-edit',
            width:400,
            height:350,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#updateAlbumForm").form("submit",{
                        url:'${pageContext.request.contextPath}/album/update',
                        success:function (result) {
                            var parseJSON = $.parseJSON(result);
                            if(parseJSON.success){
                                $.messager.show({title:'温馨提示',msg:'轮播图修改成功！'});
                            }else{
                                $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                            }
                            $("#dalbum").dialog("close");
                            $("#showAlbum").treegrid("reload");
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
<table id="showAlbum"></table>
<div id="dalbum"></div>