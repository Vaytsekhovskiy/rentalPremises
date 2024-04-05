<!DOCTYPE html>
<html>
<head>
    <title>RENTAL PREMISES</title>
</head>
<body>
<form action="" method="post">
    <input type="submit" value="Регистрация"/>
</form>
<form action="" method="post">
    <input type="submit" value="Вход"/>
</form>
<form action="/" method="get">
    Поиск по названию здания: <input type="text" name="name"/>
    <input type="submit" value="Поиск"/>
</form>
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
    <#else >
        <h3>Ничего не найдено</h3>
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

<script src="https://cdn.jsdelivr.net/npm/leaflet@1.7.1/dist/leaflet.js"></script> <!-- Подключение JavaScript-файла Leaflet -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.7.1/dist/leaflet.css" />
<div id="map" style="height: 400px;"></div> <!-- Контейнер карты -->

<script>
    // создание карты
    var map = L.map('map').setView([59.95, 30.40], 10); // Устанавливаем координаты центра карты и уровень масштабирования
    // добавление слоя тайлов
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Добавьте маркеры, линии и другие элементы на карту по необходимости
</script>
</body>
</html>