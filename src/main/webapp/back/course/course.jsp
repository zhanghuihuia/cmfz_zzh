<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function () {
        $("#showCourse").edatagrid({
            url:'${pageContext.request.contextPath}/course/queryAll',
            pagination: true,
            pageList: [2, 5, 10, 15, 20],
            pageSize: 5,
            fitColumns:true,
            columns: [[
                {title: "课程编号", field: "id", width: 230},
                {title: "课程名称", field: "title", width: 150},
                {title: "课程区别", field: "marking", width: 150},
                {title: "创建时间", field: "createTime", width: 150},
                {title: "所属用户", field: "username", width: 200}
            ]],
            toolbar: [{
                iconCls: 'icon-add',
                text:'增加必修课程',
                handler: function(){
                    $("#dcourse").dialog({
                        href:"${pageContext.request.contextPath}/back/course/addCourse.jsp",
                        title:'课程添加',
                        draggable:false,
                        iconCls:'icon-add',
                        width:400,
                        height:200,
                        buttons:[{
                            text:'保存',
                            iconCls:'icon-save',
                            handler:function(){
                                $("#addCourseForm").form("submit",{
                                    url:'${pageContext.request.contextPath}/course/save',
                                    success:function (result) {
                                        var parseJSON = $.parseJSON(result);
                                        if(parseJSON.success){
                                            $.messager.show({title:'温馨提示',msg:'课程添加成功！'});
                                        }else{
                                            $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                                        }
                                        $("#dcourse").dialog("close");
                                        $("#showCourse").edatagrid("reload");
                                    }
                                });
                            }
                        },{
                            text:'关闭',
                            iconCls:'icon-cancel',
                            handler:function(){
                                $("#dcourse").dialog("close");
                            }
                        }]
                    });
                }
            },{
                iconCls: 'icon-edit',
                text:'修改课程',
                handler: function(){
                    var select = $("#showCourse").edatagrid("getSelected");
                    if(select == null){
                        $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                    }else if(select.marking=="选修"){
                        $.messager.show({title:'温馨提示',msg:'选修课程您没有权限修改！'});
                    }else{
                        upd(select.id);
                    }
                }
            },{
                iconCls: 'icon-remove',
                text:'删除课程',
                handler: function(){
                    var select = $("#showCourse").edatagrid("getSelected");
                    if(select == null){
                        $.messager.show({title:'温馨提示',msg:'至少选中一行！'});
                    }else if(select.marking=="选修"){
                        $.messager.show({title:'温馨提示',msg:'选修课程您没有权限删除！'});
                    }else{
                        $.messager.confirm('确认删除','您确认删除此必修课程?',function(r) {
                            if(r) {
                                del(select.id);
                            }
                        });
                    }
                }
            }]
        });
    });
    /*删除方法*/
    function del(id) {
        $.post("${pageContext.request.contextPath}/course/delete",{"id":id},function (result) {
            if(result.success){
                $.messager.show({title:'温馨提示',msg:'删除成功！'});
            }else{
                $.messager.show({title:'温馨提示',msg:result.msg});
            }
            $("#showCourse").edatagrid("reload");
        });
    }
    /*更新方法*/
    function upd(id) {
        $("#dcourse").dialog({
            href:"${pageContext.request.contextPath}/back/course/updateCourse.jsp?id="+id,
            title:'课程更新',
            draggable:false,
            iconCls:'icon-edit',
            width:400,
            height:350,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#updateCourseForm").form("submit",{
                        url:'${pageContext.request.contextPath}/course/update',
                        success:function (result) {
                            var parseJSON = $.parseJSON(result);
                            if(parseJSON.success){
                                $.messager.show({title:'温馨提示',msg:'课程修改成功！'});
                            }else{
                                $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                            }
                            $("#dcourse").dialog("close");
                            $("#showCourse").edatagrid("reload");
                        }
                    });
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#dcourse").dialog("close");
                }
            }]

        });
    }
</script>
<table id="showCourse" class="easyui-dategrid" data-options="fit:true"></table>
<div id="dcourse"></div>