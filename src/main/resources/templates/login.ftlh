<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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

        h1, h2, h3 {
            color: red;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"],
        input[type="password"],
        input[type="submit"] {
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
        }

        input[type="submit"]:hover {
            background-color: darkred;
        }

        div.container {
            max-width: 800px;
            margin: 10px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form.login label {
            display: inline-block;
            width: 80px;
            text-align: left;
            margin-bottom: 5px;
        }

        form.login input[type="text"],
        form.login input[type="email"],
        form.login input[type="number"],
        form.login input[type="password"] {
            display: inline-block;
            width: calc(100% - 170px);
            max-width: 300px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        form.login input[type="submit"] {
            margin-top: 10px;
            margin-right: 20px;
        }

        /* Добавленные стили */
        .login-form {
            display: inline-block;
        }

        .login-button {
            margin-left: 10px;

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
    <script>
        function validateLoginForm() {
            var email = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var isValid = true; // Flag to track validity

            // Check if email or password field is empty
            if (email.trim() === "") {
                alert("Пожалуйста, введите адрес электронной почты.");
                isValid = false; // Set flag to false
            }

            if (password.trim() === "") {
                alert("Пожалуйста, введите пароль.");
                isValid = false; // Set flag to false
            }

            return isValid; // Return the validity flag
        }
    </script>
    <h2 class="heading">
        <a href="/" style="text-decoration: none; color: inherit;">RENTAL PREMISES</a>
    </h2>
    <h3>Добро пожаловать на сайт аренды помещений!</h3>
    <p>Авторизация</p>
    <form action="/login" method="post" class="login" onsubmit="return validateLoginForm()">
        <label for="username">Эл. почта:</label>
        <input type="email" id="username" name="username"/><br><br>
        <label for="password">Пароль:</label>
        <input type="password" id="password" name="password"/><br><br>
        <input type="submit" value="Вход"/>
    </form>
    <form action="/registration" method="get" class="login-form">
        <input type="submit" value="Зарегистрироваться" class="login-button"/>
    </form>
</div>
<script>
    var isUserLoggedIn = <#if user.username??>true<#else>false</#if>;
    if (isUserLoggedIn) {
        window.location.href = "/";
    }
</script>
</body>
</html>