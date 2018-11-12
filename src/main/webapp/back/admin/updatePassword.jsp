<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<form id="updatePwdForm" class="easyui-form" style="text-align: center">
    <input type="hidden" name="name" value="${sessionScope.admin.name}">
    <div style="margin-top: 70px;">
        <input id="password" class="easyui-textbox" data-options="label:'原密码：',labelWidth:70,width:220,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input id="xpassword1" class="easyui-textbox" data-options="label:'新密码：',labelWidth:70,width:220,required:true">
    </div>
    <div style="margin-top: 15px;">
        <input id="xpassword2" name="password" class="easyui-textbox" data-options="label:'确认密码：',labelWidth:70,width:220,required:true">
    </div>
</form>