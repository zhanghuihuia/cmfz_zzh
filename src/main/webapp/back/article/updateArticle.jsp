<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        var select = $("#showArticle").edatagrid("getSelected");
        $("#updateBannerForm").form({
            onBeforeLoad:function () {
                alert(111);
            }
        });
        $("#updateBannerForm").form('load',select);
        $('#gname').combobox({
            url:'${pageContext.request.contextPath}/guru/queryAlls',
            valueField:'id',
            textField:'name'
        });

    });
</script>
<form id="updateBannerForm" enctype="multipart/form-data" method="post" class="easyui-form" style="text-align: center">
    <input type="hidden" name="id" value="${param.id}">
    <div style="margin-top: 40px;">
        <input name="title" class="easyui-textbox" data-options="label:'标题：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input class="easyui-filebox" name="file" data-options="label:'文章插图：',labelWidth:70,width:200">
    </div>
    <div style="margin-top: 15px;">
        <input id="gname" name="sid" class="easyui-combobox" data-options="label:'文章作者：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="content" class="easyui-textbox" data-options="label:'文章内容：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="publishDate" class="easyui-datebox" data-options="label:'创建时间：',labelWidth:70,width:200,required:true">
    </div>
</form>