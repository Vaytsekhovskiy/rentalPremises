<!DOCTYPE html>
<html>
<head>
    <title>RENTAL PREMISES</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h4 {
            color: red;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"] {
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: red;
            color: white;
            cursor: pointer;
            padding: 8px;
            border: none;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: darkred;
        }

        a {
            color: red;
            text-decoration: none;
        }
    </style>
</head>
<body>
<h4>Авторизация</h4>

<form action="/login" method="post">
    Эл. почта: <input type="email" name="username"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="submit" value="Вход"/>
</form>
<a href="/registration">Зарегистрироваться</a>
</body>
</html>
