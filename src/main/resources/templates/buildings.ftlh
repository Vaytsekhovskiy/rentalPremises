<!DOCTYPE html>
<html>
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
            color: red;
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
    <#if user.username??>
    <form action="/logout" method="post" class="login-form">
        <h3> Имя пользователя: ${user.username}</h3>
        <input type="submit" value="Выйти из аккаунта"/>
    </form>
    <#else>
    <form action="/login" method="get" class="login-form">
        <input type="submit" value="Вход" class="login-button"/>
    </form>
    <h3>
        </#if>
        <form action="/" method="get" class="search">
            <label for="search">Поиск по названию здания:</label>
            <input type="text" id="search" name="name"/>
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
            <h3 class="search-error">Ничего не найдено</h3>
        </#list>
        <#if user.username??>
            <h3 class="add">Внести новое помещение</h3>
            <!--Передаёт JSON методом POST, спринг получает и автоматически конверирует в Building-->
            <!--Передаёт Building в buildingCreate(Building building)-->
            <form action="/building/create" method="post" enctype="multipart/form-data" class="buildings">
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
</div>
<script src="https://cdn.jsdelivr.net/npm/leaflet@1.7.1/dist/leaflet.js"></script>
<!-- Подключение JavaScript-файла Leaflet -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.7.1/dist/leaflet.css"/>
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