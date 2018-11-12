<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $('#gname').combobox({
            url:'${pageContext.request.contextPath}/guru/queryAlls',
            valueField:'id',
            textField:'name'
        });
    })
</script>

<form id="addArticleForm" method="post" class="easyui-form" enctype="multipart/form-data" style="text-align: center">
    <div style="margin-top: 40px;">
        <input name="title" class="easyui-textbox" data-options="label:'标题：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input class="easyui-filebox" name="file" data-options="label:'文章插图：',labelWidth:70,width:200">
    </div>
    <div style="margin-top: 15px;">
        <input id="gname" value="--请选择--" name="id" class="easyui-combobox" data-options="label:'文章作者：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="content" class="easyui-textbox" data-options="label:'文章内容：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="publishDate" class="easyui-datebox" data-options="label:'创建时间：',labelWidth:70,width:200,required:true">
    </div>
</form>