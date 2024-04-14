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
        input[type="submit"],
        input[type="file"] {
            padding: 8px;
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

        .heading {
            display: inline-block; /* Display heading as inline-block */
            margin-right: 65%; /* Add space between heading and button */
        }

        .heading:hover {
            color: darkred;
        }

        .login-form {
            display: inline-block; /* Display form as inline-block */
            margin: 0; /* Remove default margin */
        }

        .login-button {
            margin: 0; /* Remove default margin */
        }

    </style>

</head>
<body>
<div class="container">
    <h2 class="heading">
        <a href="/" style="text-decoration: none; color: inherit;">RENTAL PREMISES</a>
    </h2>
    <h3>Подробная информация о пользователе ${user.name}</h3>
    <b>Номер телефона: </b> ${user.numberPhone}<br><br>
    <b>Email: </b> ${user.username}<br><br>
    <b>ИНН: </b> ${user.inn}<br>
    <h4>Арендные помещения пользователя ${user.name}</h4>
    <#list buildings as building>
        <div>
            <form action="/building/${building.id}" method="get" class="login-form">
                <label <#--for="submit"-->> <p><b>${building.name}</b> ${building.price} руб. | </label>
                <input type="submit" value="Подробнее..." class="login-button"/>
            </form>
        </div>

    <#else>
        <h3>У пользователя нет арендных помещений</h3>
    </#list>
    <#--<#if errorMessage??>-->
    <#--    <h2 style="color: red">${errorMessage}</h2>-->
    <#--</#if>-->
</div>
</body>
</html>