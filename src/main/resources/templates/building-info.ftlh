<!DOCTYPE html>
<html>
<head>
    <title>RENTAL PREMISES</title>
</head>
<body>
<h3>
    Подробная информация о товаре
</h3>
    <div>
        <#list images as img>
            <img src="/images/${img.id}" height="80px"><br><br>
        </#list>
        Название: ${building.name}
        <br>
        Расположение: ${building.location}
        <br>
        Цена: ${building.price}
        <br>
        Владелец: <a href="/user/${building.user.id}">${building.user.name}</a>
        <br>
        Описание: ${building.description}
    </div>
<h3>Удалить помещение</h3>
<form action="/building/delete/${building.id}" method="post">
    <input type="submit" value="Удалить помещение"/>
</form>
</body>
</html>