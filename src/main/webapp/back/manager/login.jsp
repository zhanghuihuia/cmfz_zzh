<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>管理员登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script>
        function submit() {
            $("#form").form('submit',{
                url:'${pageContext.request.contextPath}/manager/login'
            });
        }
    </script>
</head>
<body style="background: url('../image/fo.jpg') no-repeat;background-size:100% 750px;">
    <div style="text-align: center;margin-top: 40px;">
        <h1 style="color: #fff;">持明法洲后台管理系统</h1>
    </div>
    <div style="width:400px;height: 250px;background-color:rgba(238,238,238,0.5);border-radius: 20px;margin-top: 150px;margin-left:150px">
        <form class="easyui-form" id="form" method="post" style="text-align: center;padding-top:50px">
            <input class="easyui-textbox" data-options="required:true,width:260,height:35,prompt:'请输入用户名',type:'text',label:'用户名：',labelWidth:70,iconCls:'icon-man'"><br><br>
            <input class="easyui-passwordbox" data-options="required:true,width:260,height:35,label:'密   码：',labelWidth:70"><br><br><br>
            <a class="easyui-linkbutton" data-options="width:100,height:30,text:'登录',onClick:submit"></a>
        </form>
    </div>
</body>
</html>