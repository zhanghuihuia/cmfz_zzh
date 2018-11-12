<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>

</head>
<body>
    <h2>Hello World!</h2>
    <form action="${pageContext.request.contextPath}/user/save" method="post" enctype="multipart/form-data" style="margin: 20px auto;">

        手机号：<input type="text" name="phoneNum" /><br><br>
        名称：<input type="text" name="name" /><br><br>
        密码：<input type="text" name="password" /><br><br>
        省份：<input type="text" name="province" /><br><br>
        市份：<input type="text" name="city" /><br><br>
        法名：<input type="text" name="nickName" /><br><br>
        性别：<input type="text" name="sex" /><br><br>
        签名：<input type="text" name="sign" /><br><br>
        头像：<input type="file" name="file" /><br><br>
        <input type="submit" />
    </form>
</body>
</html>
