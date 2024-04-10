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
</head>
<body>

<#if user.username??>
<form action="/logout" method="post">
    <h3> Имя пользователя: ${user.username} </h3>
    <input type="submit" value="Выйти из аккаунта"/>
</form>
<#if user.isAdmin()>
    <a href="/admin"> Панель администратора</a>
</#if>
<#else>
<h1><a href="/login">Войти</a></h1>
</#if>
<form action="/" method="get">
    Поиск по названию здания: <input type="text" name="name"/>
    <input type="submit" value="Поиск"/>
</form>
<#list buildings as building>
<!--реализованно при помощи freeMarker, buildings передаётся через buildings(Model model)-->
<!--цикл for, проходимся по каждому зданию-->
<div>
    <hr>
    Название: ${building.name}
    <br>
    Расположение: ${building.location}
    <br>
    Цена: ${building.price}
    <br>
    Владелец: ${building.user.username}
    <br>
    Описание: ${building.description}
    <br>
    <a href="/building/${building.id}">Подробнее...</a>
</div>
<#else >
<h3>Ничего не найдено</h3>
</#list>
<#if user.username??>
    <h3>Внести новое помещение</h3>
    <!--Передаёт JSON методом POST, спринг получает и автоматически конверирует в Building-->
    <!--Передаёт Building в buildingCreate(Building building)-->
    <form action="/building/create" method="post" enctype="multipart/form-data">
        Название: <input type="text" name="name"/><br><br>
        Расположение: <input type="text" name="location"/><br><br>
        Цена: <input type="number" name="price"/><br><br>
        Описание: <input type="text" name="description"/><br><br>
        Фасад: <input type="file" name="frontFile"/><br><br>
        Вход: <input type="file" name="entranceFile"/><br><br>
        Интерьер: <input type="file" name="interiorFile"/><br><br>
        <input type="submit" value="Добавить помещение"/>
    </form>
<#else>
<h4> Войдите в аккаунт, чтобы добавить помещение </h4>
</#if>
<#--<script src="https://cdn.jsdelivr.net/npm/leaflet@1.7.1/dist/leaflet.js"></script> <!-- Подключение JavaScript-файла Leaflet &ndash;&gt;-->
<#--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.7.1/dist/leaflet.css"/>-->
<div id="map" style="height: 400px;"></div> <!-- Контейнер карты -->

<#--<input id=“freemarkervar” type=“text or hidden” value=“${myVariable}”/>-->
<script>
    // создание карты
    var map = L.map('map').setView([59.95, 30.40], 10); // Устанавливаем координаты центра карты и уровень масштабирования
    // добавление слоя тайлов
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    // список мапов с данными о зданиях
    var mapBuildings = [
        <#list buildings as building>
        {
            name: "${building.name}",
            strLocation: "${building.location}",
            price: "${building.price}",
            username: "${building.user.username}",
            description: "${building.description}"
        }<#sep>,
        </#list>
    ];

    for (var i = 0; i < mapBuildings.length; i++) {
        makeMarker(mapBuildings[i]);
    }

    async function makeMarker(building) {
        console.log(building["strLocation"])
        const response = await fetch("https://nominatim.openstreetmap.org/search?format=json&q=" + building["strLocation"]);
        const jsonLocation = await response.json();
        const location = jsonLocation[0];
        console.log(location)
        L.marker([location["lat"], location["lon"]]).addTo(map)
            .bindPopup(
                '<h1>' + building["name"] + '</h1><br>' + building["strLocation"]
            );
    }
</script>
</body>
</html>