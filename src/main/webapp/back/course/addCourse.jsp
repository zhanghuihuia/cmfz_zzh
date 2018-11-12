<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<form id="addCourseForm" method="post" class="easyui-form" style="text-align: center">
    <div style="margin-top: 40px;">
        <input name="title" class="easyui-textbox" data-options="label:'课程名称：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input name="createTime" class="easyui-datebox" data-options="label:'创建日期：',labelWidth:70,width:200,required:true">
    </div>
</form>