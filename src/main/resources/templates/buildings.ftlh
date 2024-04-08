<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" lang="ru">
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
        input[type="submit"] {
            padding: 8px;
            margin: 5px 0;
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

        #map {
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
        }

        div.container {
            max-width: 800px;
            margin: 0 auto;
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
        form.buildings input[type="number"] {
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
    </style>
</head>
<body>
<div class="container">
    <h2 class="heading">RENTAL PREMISES</h2>
    <#if errorMessage??>
        <h3>${errorMessage}</h3>
    </#if>
    <form action="/login" method="get" class="login-form">
        <input type="submit" value="Вход" class="login-button"/>
    </form>
    <form action="/" method="get" class="search">
        <label for="search">Поиск по названию здания:</label>
        <input type="text" id="search" name="name"/>
        <input type="submit" value="Поиск"/>
    </form>
    <#list buildings as building>
        <div>
            <hr>
            <p>Название: ${building.name}</p>
            <p>Расположение: ${building.location}</p>
            <p>Цена: ${building.price}</p>
            <p>Владелец: ${building.owner}</p>
            <p>Описание: ${building.description}</p>
            <a href="/building/${building.id}">Подробнее...</a>
        </div>
    <#else>
        <h4 class="search-error">Ничего не найдено</h4>
    </#list>
    <h3 class="add">Внести новое помещение</h3>
    <form action="/building/create" method="post" class="buildings">
        <label for="name">Название:</label>
        <input type="text" id="name" name="name"/><br><br>
        <label for="location">Расположение:</label>
        <input type="text" id="location" name="location"/><br><br>
        <label for="price">Цена:</label>
        <input type="number" id="price" name="price"/><br><br>
        <label for="owner">Владелец:</label>
        <input type="text" id="owner" name="owner"/><br><br>
        <label for="description">Описание:</label>
        <input type="text" id="description" name="description"/><br><br>
        <input type="submit" value="Добавить помещение"/>
    </form>
</div>

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