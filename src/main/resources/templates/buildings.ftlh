<!DOCTYPE html>
<html>
<head>
    <title>RENTAL PREMISES</title>
</head>
<body>
<#list buildings as building> <!--реализованно при помощи freeMarker, buildings передаётся через buildings(Model model)-->
    <!--цикл for, проходимся по каждому зданию-->
    <div>
        <hr>
        Название: ${building.name}
        <br>
        Расположение: ${building.location}
        <br>
        Цена: ${building.price}
        <br>
        Владелец: ${building.owner}
        <br>
        Описание: ${building.description}
        <br>
        <a href="/building/${building.id}">Подробнее...</a>
    </div>
</#list>
<h3>Внести новое помещение</h3>
<!--Передаёт JSON методом POST, спринг получает и автоматически конверирует в Building-->
<!--Передаёт Building в buildingCreate(Building building)-->
<form action="/building/create" method="post">
    Название: <input type="text" name="name"/><br><br>
    Расположение: <input type="text" name="location"/><br><br>
    Цена: <input type="number" name="price"/><br><br>
    Владелец: <input type="text" name="owner"/><br><br>
    Описание: <input type="text" name="description"/><br><br>
    <input type="submit" value="Добавить помещение"/>
</form>
</body>
</html>