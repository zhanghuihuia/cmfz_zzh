<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<form id="addBannerForm" method="post" class="easyui-form" enctype="multipart/form-data" style="text-align: center">
    <div style="margin-top: 40px;">
        <input name="title" class="easyui-textbox" data-options="label:'标题：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <%--<input name="imgPath" class="easyui-textbox" data-options="label:'地址：',labelWidth:70,width:200,required:true">--%>
        <input class="easyui-filebox" name="file" data-options="label:'图片：',labelWidth:70,width:200">
    </div>
    <div style="margin-top: 15px;">
        <input name="description" class="easyui-textbox" data-options="label:'描述：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <%--<input name="status" class="easyui-textbox" data-options="label:'状态：',labelWidth:70,width:200,required:true">--%>
        <select name="status" class="easyui-combobox" data-options="label:'状态：',labelWidth:70,width:200,required:true">
            <option >--请选择--</option>
            <option value="1">1-启用</option>
            <option value="2">2-禁用</option>
        </select>
    </div>
    <div style="margin-top: 15px;">
        <input name="createDate" class="easyui-datebox" data-options="label:'创建时间：',labelWidth:70,width:200,required:true">
    </div>
</form>