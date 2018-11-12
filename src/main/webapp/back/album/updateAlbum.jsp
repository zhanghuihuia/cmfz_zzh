<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#updateAlbumForm").form('load','${pageContext.request.contextPath}/album/queryOne?id=${param.id}');
    });
</script>
<form id="updateAlbumForm" enctype="multipart/form-data" method="post" class="easyui-form" style="text-align: center">
    <input type="hidden" name="id" value="${param.id}">
    <div style="margin-top: 40px;">
        <input name="title" class="easyui-textbox" data-options="label:'标题：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="publishDate" class="easyui-datebox" data-options="label:'发布日期：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input class="easyui-filebox" name="file" data-options="label:'封面图片：',labelWidth:70,width:200">
    </div>
    <div style="margin-top: 15px;">
        <input name="star" class="easyui-textbox" data-options="label:'星级：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="author" class="easyui-textbox" data-options="label:'作者：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="broadCast" class="easyui-textbox" data-options="label:'播音：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="brief" class="easyui-textbox" data-options="label:'简介：',labelWidth:70,width:200,required:true">
    </div>
</form>