<!DOCTYPE html>
<html>
<head>
    <title>BUYSELL</title>
</head>
<body>
<h4>Регистрация</h4>
<form action="/registration" method="post">
    Имя пользователя: <input type="text" name="username"><br><br>
    Эл. почта: <input type="email" name="email"><br><br>
    Номер телефона: <input type="text" name="phone_number"><br><br>
    ИНН: <input type="number" name="inn"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="submit" value="Зарегистрироваться"/>
</form>
<#if errorrMessage??>
    <h2 style="color: #ff0000">${errorMessage}</h2>
</#if>
</body>
</html>