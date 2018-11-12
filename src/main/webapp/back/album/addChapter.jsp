<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<form id="addChapterForm" method="post" class="easyui-form" enctype="multipart/form-data" style="text-align: center">
    <input type="hidden" name="id" value="${param.id}">
    <div style="margin-top: 40px;">
        <input name="title" class="easyui-textbox" data-options="label:'标题：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="uploadTime" class="easyui-datebox" data-options="label:'上传日期：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input class="easyui-filebox" name="file" data-options="label:'音频上传：',labelWidth:70,width:200">
    </div>
</form>