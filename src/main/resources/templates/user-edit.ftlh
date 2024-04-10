<!DOCTYPE html>
<html>
<head>
    <title>RENTAL PREMISES</title>
</head>
<body>
<h1>RENTAL PREMISES</h1><hr>
<h3>Редактирование пользователя ${user.name}</h3>
<form action="/admin/user/edit" method="post">
    <#list roles as role>
        <div>
            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
        </div>
    </#list>
    <input type="hidden" value="${user.id}" name="userId">
    <button type="submit">Сохранить</button>
</form>
</body>
</html>