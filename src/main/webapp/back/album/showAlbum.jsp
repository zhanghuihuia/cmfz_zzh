<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        var selectOne = $("#showAlbum").edatagrid("getSelected");
        $("#showAlbumForm").form('load',selectOne);
        $("#imgs").attr("src","${pageContext.request.contextPath}"+selectOne.coverImg);
    });
</script>
<img id="aaa" />
<form id="showAlbumForm" enctype="multipart/form-data" method="post" class="easyui-form" style="padding-left:200px;text-align: center">
    <img id="imgs" style="position: absolute;left: 70px;top: 120px;" />
    <input type="hidden" name="id" value="${param.id}">
    <div style="margin-top: 30px;">
        <input name="title" class="easyui-textbox" style="border: 0" data-options="label:'标题：',labelWidth:70,width:200,readonly:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="count" class="easyui-textbox" data-options="label:'章节数：',labelWidth:70,width:200,readonly:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="publishDate" class="easyui-datebox" data-options="label:'发布日期：',labelWidth:70,width:200,readonly:true">
    </div>
    <div style="margin-top: 15px;">
        <input id="img" class="easyui-textbox" name="coverImg" data-options="label:'封面图片：',labelWidth:70,width:200,readonly:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="star" class="easyui-textbox" data-options="label:'星级：',labelWidth:70,width:200,readonly:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="author" class="easyui-textbox" data-options="label:'作者：',labelWidth:70,width:200,readonly:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="broadCast" class="easyui-textbox" data-options="label:'播音：',labelWidth:70,width:200,readonly:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="brief" class="easyui-textbox" data-options="label:'简介：',labelWidth:70,width:200,readonly:true">
    </div>
</form>