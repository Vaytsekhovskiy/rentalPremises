<!DOCTYPE html>
<html>
<head>
    <title>RENTAL PREMISES</title>
</head>
<body>
<h4>Регистрация</h4>
<form action="/registration" method="post">
    Имя пользователя: <input type="text" name="name"><br><br>
    Эл. почта: <input type="email" name="username"><br><br>
    Номер телефона: <input type="text" name="numberPhone"><br><br>
    ИНН: <input type="number" name="inn"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="submit" value="Зарегистрироваться"/>
</form>
<#if errorMessage??>
    <h2 style="color: #ff0000">${errorMessage}</h2>
</#if>
</body>
</html>