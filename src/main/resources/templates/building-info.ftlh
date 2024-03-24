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
        Название: ${building.name}
        <br>
        Расположение: ${building.location}
        <br>
        Цена: ${building.price}
        <br>
        Владелец: ${building.owner}
        <br>
        Описание: ${building.description}
    </div>
<h3>Удалить помещение</h3>
<form action="/building/delete/${building.id}" method="post">
    <input type="submit" value="Удалить помещение"/>
</form>
</body>
</html>