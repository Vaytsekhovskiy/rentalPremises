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
            width: 170px;
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
        /* убрать стрелки у input type="number" */
        /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
        }
    </style>
</head>
<body>
<div class="container">
    <script>
        function validateRegistrationForm() {
            var name = document.getElementById("name").value;
            var email = document.getElementById("username").value;
            var numberPhone = document.getElementById("numberPhone").value;
            var inn = document.getElementById("inn").value;
            var password = document.getElementById("password").value;
            var isValid = true;

            if (name.trim() === "") {
                alert("Пожалуйста, введите имя пользователя.");
                isValid = false;
            }

            if (email.trim() === "") {
                alert("Пожалуйста, введите адрес электронной почты.");
                isValid = false;
            }

            if (numberPhone.trim() === "") {
                alert("Пожалуйста, введите номер телефона.");
                isValid = false;
            }

            if (inn.trim() === "") {
                alert("Пожалуйста, введите ИНН.");
                isValid = false;
            } else if (inn.length !== 12 || isNaN(inn)) {
                alert("ИНН должен состоять из 12 цифр.");
                isValid = false;
            }

            if (password.trim() === "") {
                alert("Пожалуйста, введите пароль.");
                isValid = false;
            }

            return isValid;
        }
    </script>
    <h2 class="heading">
        <a href="/" style="text-decoration: none; color: inherit;">RENTAL PREMISES</a>
    </h2>
    <h3>Регистрация</h3>
    <form action="/registration" method="post" class="buildings" onsubmit="return validateRegistrationForm()">
        <label for="name">Имя пользователя:</label>
        <input type="text" id="name" name="name"/><br><br>
        <label for="username">Эл. почта:</label>
        <input type="email" id="username" name="username"/><br><br>
        <label for="numberPhone">Номер телефона с +7:</label>
        <input type="text" id="numberPhone" name="numberPhone" oninput="formatPhoneNumber()"/><br><br>
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
<script>
    function formatPhoneNumber() {
        var input = document.getElementById("numberPhone");
        var cleaned = ('' + input.value).replace(/\D/g, '');
        var match = cleaned.match(/^(\d{1})(\d{0,3})(\d{0,3})(\d{0,2})(\d{0,2})$/);
        if (match) {
            var formatted = '+';
            formatted += match[1];
            if (match[2]) formatted += ' ' + match[2];
            if (match[3]) formatted += ' ' + match[3];
            if (match[4]) formatted += '-' + match[4];
            if (match[5]) formatted += '-' + match[5];
            input.value = formatted;
        }
        if (cleaned.length >= 11) {
            input.setAttribute("maxlength", "15");
        } else {
            input.removeAttribute("maxlength");
        }
    }
</script>
</body>
</html>
