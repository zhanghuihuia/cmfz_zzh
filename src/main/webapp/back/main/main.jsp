<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.edatagrid.js"></script>

    <script type="text/javascript">
        <!--菜单处理-->
        $(function () {
            var str = "${sessionScope.admin}";
            if(str==""){
                location.href = "${pageContext.request.contextPath}/back/login.jsp";
            }
            $.post("${pageContext.request.contextPath}/menu/queryAll",function (menu) {
                $.each(menu.rows,function (index,m) {
                    var content = "<div style='text-align: center;'>";
                   $.each(m.menus,function (index,child) {
                       content += "<a onclick=\"addtab('"+child.title+"','"+child.iconCls+"','"+child.href+"')\" style='width: 93%;border:1px solid #00bbee;margin:10px 0;' class='easyui-linkbutton' data-options=\"plain:true,text:'"+child.title+"',iconCls:'"+child.iconCls+"',\"></a>";
                   });
                   content += "</div>";
                   $("#aa").accordion("add",{
                       title:m.title,
                       iconCls:m.iconCls,
                       content:content,
                   });
                });
            });

        });
        //主页添加tab
        function addtab(title,iconCls,href) {
            var tabs = $("#tt").tabs("exists",title);
            if(!tabs){
                $("#tt").tabs("add",{
                    title:title,
                    iconCls:iconCls,
                    href:"${pageContext.request.contextPath}"+href,
                    closable:true,
                })
            }else{
                $("#tt").tabs("select",title);
            }
        }
        /*修改密码*/
        function change() {
            $("#dia").dialog({
                href:"${pageContext.request.contextPath}/back/admin/updatePassword.jsp",
                title:'密码修改',
                draggable:false,
                iconCls:'icon-edit',
                width:400,
                height:300,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-save',
                    handler:function(){
                        var apassword = '${sessionScope.admin.password}';
                        var password = $("#password").val();
                        var password1 = $("#xpassword1").val();
                        var password2 = $("#xpassword2").val();
                        if(apassword != password){
                            $.messager.show({title:'温馨提示',msg:'原密码不正确'});
                        }else if(password1!=password2){
                            $.messager.show({title:'温馨提示',msg:'两次输入的密码不一致'});
                        }else{
                            $("#updatePwdForm").form("submit",{
                                url:'${pageContext.request.contextPath}/admin/updatePassword',
                                success:function (result) {
                                    var parseJSON = $.parseJSON(result);
                                    if(parseJSON.success){
                                        $.messager.show({title:'温馨提示',msg:'密码修改成功！'});
                                        setTimeout(function () {
                                            location.href="${pageContext.request.contextPath}/back/login.jsp";
                                        },2000);
                                    }else{
                                        $.messager.show({title:'温馨提示',msg:parseJSON.msg});
                                    }
                                    $("#dia").dialog("close");
                                }
                            });
                        }
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $("#dia").dialog("close");
                    }
                }]
            });
        }
        /*退出系统*/
        function tuichu() {
            $.messager.confirm('确认退出','您确认要退出后台管理系统?',function (r) {
                if (r){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/admin/clear",
                        success:function () {
                            location.href = "${pageContext.request.contextPath}/back/login.jsp";
                        }
                    });
                }
            });
        }
    </script>
</head>
<body class="easyui-layout">
    <%--head--%>
    <div data-options="region:'north',split:false" style="height:60px;background-color:  #5C160C">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 400px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
    	<div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 330px;float:right;padding-top:15px">
            欢迎您:${sessionScope.admin.name} &nbsp;
            <a class="easyui-linkbutton" data-options="iconCls:'icon-edit',onClick:change">修改密码</a>&nbsp;&nbsp;
            <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel',onClick:tuichu">退出系统</a>
        </div>
    </div>   

       
    <div data-options="region:'west',title:'导航菜单',split:false" style="width:220px;">
    	<div id="aa" class="easyui-accordion" data-options="fit:true">
    		
		</div>  
    </div>   
    <div data-options="region:'center'">
    	<div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,closable:true">
		    <div title="主页" data-options="iconCls:'icon-tip',closable:true"  style="background-image:url(${pageContext.request.contextPath}/back/main/image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
		</div>  
    </div>
    <%--footer--%>
    <div data-options="region:'south',split:false" style="height: 40px;background: #5C160C">
        <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>

    <div id="dia"></div>
</body> 
</html>