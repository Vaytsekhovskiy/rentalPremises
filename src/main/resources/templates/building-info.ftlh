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

        #map {
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 10px auto;
        }

        div.container {
            max-width: 800px;
            margin: 10px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form.buildings {
            text-align: center; /* Center align form elements */
        }

        form.buildings label {
            display: inline-block; /* Make labels display as inline-block */
            width: 120px; /* Set a fixed width for labels */
            text-align: left; /* Align labels to the left */
            margin-bottom: 5px; /* Add some space between labels and inputs */
        }

        form.buildings input[type="text"],
        form.buildings input[type="number"],
        form.buildings input[type="file"] {
            display: inline-block; /* Make inputs display as inline-block */
            width: calc(100% - 170px); /* Set the width of inputs, accounting for label width and margin */
            max-width: 300px; /* Limit maximum width of inputs */
            margin-bottom: 10px; /* Add some space below inputs */
        }

        form.buildings input[type="submit"] {
            margin-top: 10px; /* Add space above the submit button */
        }

        h3.add {
            text-align: center;
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

        .search {
            text-align: right;
        }

        .search-error {
            text-align: right;
        }

        .building-info {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }

        .building-info h4 {
            color: #333;
            margin-bottom: 5px;
        }

        .building-info p {
            margin: 5px 0;
        }

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

        #map {
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 10px auto;
        }

        .image-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
        }

        .image-list img {
            margin-right: 10px;
            margin-bottom: 10px;
        }

    </style>

</head>
<body>
<div class="container">
    <h2 class="heading">
        <a href="/" style="text-decoration: none; color: inherit;">RENTAL PREMISES</a>
    </h2>
    <h3>
        Подробная информация о помещении
    </h3>
    <div>
        <div class="image-list">
            <#list images as img>
                <a href="/images/${img.id}" target="_blank">
                    <img src="/images/${img.id}" height="250px">
                </a>
            </#list>
        </div>

        Название: ${building.name}
        <br>
        Расположение: ${building.location}
        <br>
        Цена: ${building.price}
        <br>
        Владелец: <a href="/user/${building.user.id}">Подробнее...</a>
        <#-- НЕ ФИКСИТЬ! Если вместо подробнее поставить building.user.username, по возникает ошибка
         при чтении LoB объектов-->
        <br>
        Описание: ${building.description}
    </div>
    <#-- Выставление статуса здания админом -->
    <#if user.isAdmin()>
        Я админ
        <form action="/building/approved/${building.id}" method="post">
            <label for="approvedCheckbox">Статус:</label>
            <input type="checkbox" id="approvedCheckbox" name="approved"><br>
            <input type="submit" value="изменить статус"/>
            <input type="hidden" name="approved" value="false"> <!-- Добавляем скрытое поле с значением false -->
        </form>
    </#if>
    <#-- Проверяем, является ли текущий пользователь владельцем помещения или администратором -->
    <#if user.id == building.user.id || user.isAdmin()>
    <#-- НЕ ФИКСИТЬ! АНАЛОГИЧНАЯ ПРИЧИНА-->
        <form action="/building/delete/${building.id}" method="post" class="login-button">
            <input type="submit" value="Удалить помещение"/>
        </form>
    <#else>
        <p>Вы не можете удалить это помещение</p>
    </#if>
</div>

<div id="map" style="height: 400px;"></div> <!-- Контейнер карты -->
<script>
    // создание карты
    var map = L.map('map').setView([59.95, 30.40], 10); // Устанавливаем координаты центра карты и уровень масштабирования
    // добавление слоя тайлов
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    // мап (словарь) с данными о здании
    var buildingData =
        {
            id: ${building.id},
            name: "${building.name}",
            strLocation: "${building.location}",
            price: "${building.price}",
            username: "${building.user.username}",
            description: "${building.description}"
        };

    makeMarker(buildingData);

    async function makeMarker(building) {
        const response = await fetch("https://nominatim.openstreetmap.org/search?format=json&q=" + building["strLocation"]);
        const jsonLocation = await response.json();
        const location = jsonLocation[0];
        L.marker([location["lat"], location["lon"]]).addTo(map)
            .bindPopup(
                '<h3>' + building["name"] + '</h3>' + building["strLocation"] + '<br><form action="/building/'
                + building.id + '" method="get" class="login-form"><input type="submit" value="Подробнее..." class="login-button"/></form>'
            );
    }
</script>
</body>
</html>