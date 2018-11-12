<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<form id="addGuruForm" method="post" class="easyui-form" enctype="multipart/form-data" style="text-align: center">
    <div style="margin-top: 40px;">
        <input name="name" class="easyui-textbox" data-options="label:'上师名称：',labelWidth:70,width:200,required:true">
    </div>
    <div style="margin-top: 15px;">
        <%--<input name="imgPath" class="easyui-textbox" data-options="label:'地址：',labelWidth:70,width:200,required:true">--%>
        <input class="easyui-filebox" name="file" data-options="label:'上师头像：',labelWidth:70,width:200">
    </div>
    <div style="margin-top: 15px;">
        <select name="sex" class="easyui-combobox" data-options="label:'上师性别：',labelWidth:70,width:200,required:true">
            <option >--请选择--</option>
            <option value="男">男</option>
            <option value="女">女</option>
        </select>
    </div>
    <div style="margin-top: 15px;">
        <select name="status" class="easyui-combobox" data-options="label:'上师状态：',labelWidth:70,width:200,required:true">
            <option >--请选择--</option>
            <option value="1">1-启用</option>
            <option value="2">2-禁用</option>
        </select>
    </div>
</form>