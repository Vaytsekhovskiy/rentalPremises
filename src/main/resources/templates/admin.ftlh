<!DOCTYPE html>
<html>
<head>
    <title>RENTAL PREMISES</title>
</head>
<body>
<h1>RENTAL PREMISES</h1>
<hr>
<h4>Панель администратора</h4>
<table border="1">
    <tr>
        <th>Email</th>
        <th>ФИО</th>
        <th>Номер телефона</th>
        <th>ИНН</th>
        <th>Активность</th>
        <th>Роли</th>
        <th>Бан</th>
        <th>Редактирование</th>
        <th>Подробная информация</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.username}</th>
            <th>${user. name}</th>
            <th>${user.numberPhone}</th>
            <th>${user.inn}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th><#list user.roles as role>${role}</#list></th>
            <th>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <#if user.active>
                    <input type="submit" value="Бан">
                    <#else>
                    <input type="submit" value="Разбан">
                    </#if>
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}">Редактировние</a></th>
            <th><a href="/user/${user.id}">Подробная информация</a></th>
        </tr>
    <#else>
        <h3>Пользователей нет</h3>
    </#list>
</table>
</body>
</html>