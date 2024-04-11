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

        h2, h3, h4 {
            color: red;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"],
        input[type="password"],
        input[type="submit"] { /* Добавляем стили для кнопки */
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] { /* Добавляем стили для кнопки */
            background-color: red;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover { /* Добавляем стили для кнопки */
            background-color: darkred;
        }

        hr {
            border: none;
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }

        div.container {
            max-width: 800px;
            margin: 10px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form.buildings label {
            display: inline-block;
            width: 150px;
            text-align: left;
            margin-bottom: 5px;
        }

        form.buildings input[type="text"],
        form.buildings input[type="number"],
        form.buildings input[type="email"],
        form.buildings input[type="password"] {
            display: inline-block;
            width: calc(100% - 170px);
            max-width: 300px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        form.buildings input[type="submit"] {
            margin-top: 10px;
        }

        .heading {
            display: inline-block; /* Display heading as inline-block */
            margin-right: 65%; /* Add space between heading and button */
        }

        .heading:hover {
            color: darkred;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="heading">
        <a href="/" style="text-decoration: none; color: inherit;">RENTAL PREMISES</a>
    </h2>
    <h3>Регистрация</h3>
    <form action="/registration" method="post" class="buildings">
        <label for="name">Имя пользователя:</label>
        <input type="text" id="name" name="name"/><br><br>
        <label for="username">Эл. почта:</label>
        <input type="email" id="username" name="username"/><br><br>
        <label for="numberPhone">Номер телефона:</label>
        <input type="text" id="numberPhone" name="numberPhone"/><br><br>
        <label for="inn">ИНН:</label>
        <input type="number" id="inn" name="inn"/><br><br>
        <label for="password">Пароль:</label>
        <input type="password" id="password" name="password"/><br><br>
        <input type="submit" value="Зарегистрироваться"/>
    </form>

    <#if errorMessage??>
        <h2 style="color: #ff0000">${errorMessage}</h2>
    </#if>
</div>
</body>
</html>
