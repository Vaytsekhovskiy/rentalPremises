<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
          integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
          crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
            integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
            crossorigin=""></script>
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
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="file"]:hover {
            background-color: darkgrey;
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

        .container {
            width: auto; /* изменено */
            margin: 10px 5px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center; /* добавлено */
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center; /* изменено */
        }

        th {
            background-color: #f2f2f2;
        }

        th:first-child, td:first-child {
            text-align: center;
        }

        th:last-child, td:last-child {
            text-align: center;
        }

        .action {
            padding-left: 10px; /* Уменьшен отступ слева */
            padding-right: 10px; /* Уменьшен отступ справа */
        }

        .action form {
            display: inline; /* Добавлено, чтобы кнопки находились на одной строке */
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
    <hr>
    <h4>Панель администратора</h4>
    <table>
        <tr>
            <th>Email</th>
            <th>ФИО</th>
            <th>Номер<br>телефона</th>
            <th>ИНН</th>
            <th>Активность</th>
            <th>Роли</th>
            <th>Бан</th>
            <th>Редактирование</th>
            <th>Подробная<br>информация</th>
        </tr>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td>${user. name}</td>
                <td>${user.numberPhone}</td>
                <td>${user.inn}</td>
                <td><#if user.active>true<#else>false</#if></td>
                <td><#list user.roles as role>${role}</#list></td>
                <td>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <#if user.active>
                            <input type="submit" value="Бан">
                        <#else>
                            <input type="submit" value="Разбан">
                        </#if>
                    </form>
                </td>
                <td class="action">
                    <form action="/admin/user/edit/${user.id}" method="get">
                        <input type="submit" value="Редактирование">
                    </form>
                </td>
                <td class="action">
                    <form action="/user/${user.id}" method="get">
                        <input type="submit" value="Подробная информация"><br>
                    </form>
                </td>
            </tr>
        </#list>
    </table>
</div>
</body>
</html>
