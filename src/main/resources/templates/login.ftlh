<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<html>
<head>
    <title>RENTAL PREMISES</title>
</head>
<body>
<h4>Авторизация</h4>

<form action="/login" method="post">
    Эл. почта: <input type="text" name="username"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="submit" value="Вход"/>
</form>
<a href="/registration">Зарегистрироваться</a>
</body>
</html>