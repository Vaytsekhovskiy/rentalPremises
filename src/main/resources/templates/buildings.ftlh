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

        select {
            appearance: none;
            -webkit-appearance: none;
        }

        input[type="text"],
        input[type="number"],
        input[type="submit"],
        select,
        input[type="button"],
        input[type="file"],
        input[type="checkbox"] {
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="file"]:hover {
            background-color: darkgrey;
        }

        input[type="submit"],
        input[type="button"] {
            background-color: red;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: darkred;
        }

        input[type="button"]:hover {
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
        select,
        form.buildings input[type="file"] {
            display: inline-block; /* Make inputs display as inline-block */
            width: calc(100% - 170px); /* Set the width of inputs, accounting for label width and margin */
            max-width: 300px; /* Limit maximum width of inputs */
            margin-bottom: 10px; /* Add some space below inputs */
        }

        form.buildings input[type="submit"] {
            margin-top: 10px; /* Add space above the submit button */
        }

        #detailedLocationTable {
            display: inline-table;
        }

        #detailedLocationTable input {
            background-color: darkgrey;
        }

        h3.add {
            margin-left: 280px;
            margin-right: 280px;
            cursor: pointer;
        }

        .add:hover {
            color: darkred;
        }

        .alt-login {
            margin: 0 209px;
        }

        .alt-login:hover {
            color: darkred;
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

        /* ... previous CSS ... */

        form.search label { /* Target all labels within the form */
            width: 188px; /* Adjust the width as needed */
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

        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(154px);
            -ms-transform: translateX(154px);
            transform: translateX(154px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }

        /* ... previous CSS ... */

        .checkbox-wrapper {
            display: flex; /* Use flexbox for alignment */
            align-items: center; /* Align items vertically to the middle */
            justify-content: flex-end;
        }

        .checkbox-wrapper label:first-child { /* Target the text label */
            margin-right: 3px; /* Add some space between the label and switch */
        }

        .admin-form {
            margin: 0;
            text-align: right;
        }

        .username {
            text-align: right;
            margin: 0;
        }

        .username:hover {
            color: darkred;
        }

        .building-flex-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .building-info {
            width: calc(50% - 10px); /* 50% width for each card with 10px spacing */
            margin-bottom: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            box-sizing: border-box;
        }

        /* убрать стрелки у input type="number" */
        /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
        }

        #locationLoading {
            display: none;
        }

        @media (max-width: 768px) {
            .building-info {
                width: calc(100% - 10px); /* On smaller screens, show one card per line */
            }
        }

        .image-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
        }

        .image-container img {
            max-height: 250px;
            max-width: 100%;
        }

    </style>
</head>
<body>
<div class="container">
    <script>
        function checkFiles(input) {

            if (input.files && input.files.length > 5) {
                alert("Вы можете загрузить не более 5 файлов.");
                input.value = ''; // Очистка выбранных файлов
                return;
            }
            if (input.files && input.files.length > 0) {
                for (let i = 0; i < input.files.length; i++) {
                    var file = input.files[i];
                    var fileSize = file.size; // Размер файла в байтах
                    var maxSize = 5 * 1024 * 1024; // Максимальный размер файла в байтах (5 MB)

                    if (!['image/jpeg', 'image/jpg', 'image/png', 'image/gif'].includes(file.type)) {
                        alert('Пожалуйста, выберите файлы только с расширением .jpg, .jpeg, .png или .gif.');
                        input.value = ''; // Очистка выбранного файла
                        return;
                    }

                    if (fileSize > maxSize) {
                        alert('Размер файла должен быть меньше 5 МБ.');
                        input.value = ''; // Очистка выбранного файла
                        return;
                    }
                }
            }
        }
    </script>
    <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var strLocation = document.getElementById("strLocation").value;
            var lat = document.getElementById("lat").value;
            var lon = document.getElementById("lon").value;
            var price = document.getElementById("price").value;
            var frontFiles = document.getElementById("frontFile").files;
            var entranceFiles = document.getElementById("entranceFile").files;
            var interiorFiles = document.getElementById("interiorFile").files;

            // Check if name, strLocation, and price are empty
            if (name.trim() === "") {
                alert("Пожалуйста, заполните поле 'Название'.");
                return false; // Prevent form submission
            }

            if (strLocation.trim() === "" || lat.trim() === "" || lon.trim() === "") {
                alert("Пожалуйста, заполните поле 'Расположение'.");
                return false; // Prevent form submission
            }

            if (price.trim() === "") {
                alert("Пожалуйста, заполните поле 'Цена'.");
                return false; // Prevent form submission
            }

            // Check if price is non-negative
            if (price < 0) {
                alert("Цена должна быть неотрицательной.");
                return false; // Prevent form submission
            }

            // Check if at least one file has been added
            if (frontFiles.length === 0) {
                alert("Пожалуйста, загрузите картинку фасада.");
                return false; // Prevent form submission
            }

            return true; // Allow form submission
        }
    </script>
    <script>
        function validateSearchForm() {
            var name = document.getElementById("searchName").value;
            var strLocation = document.getElementById("searchLocation").value;
            var price = document.getElementById("searchPrice").value;

            // Check if any search field is not empty
            if (name.trim() === "" && strLocation.trim() === "" && price.trim() === "") {
                alert("Пожалуйста, заполните хотя бы одно поле для поиска.");
                return false; // Prevent form submission
            }

            return true; // Allow form submission
        }
    </script>
    <h2 class="heading">
        <a href="/" style="text-decoration: none; color: inherit;">RENTAL PREMISES</a>
    </h2>
    <#if user.username??>
        <form action="/logout" method="post" class="admin-form">
            <h3 class="username">
                <a href="/user/${user.id}" style="text-decoration: none; color: inherit;">Имя
                    пользователя: ${user.username}</a>
            </h3>
            <input type="submit" value="Выйти из аккаунта" class="login-button"/>
        </form>
        <#if user.isAdmin()>
            <form action="/admin" method="get" class="admin-form">
                <input type="submit" value="Панель администратора" class="admin-button"/>
            </form>
        </#if>
    <#else>
        <form action="/login" method="get" class="login-form">
            <input type="submit" value="Вход" class="login-button"/>
        </form>
    </#if>
    <!--фильтрация зданий-->
    <form action="/" method="get" class="search" onsubmit="return validateSearchForm()">
        <label for="searchName">Поиск по названию здания:</label>
        <input type="text" id="searchName" name="name"/><br>

        <label for="searchLocation">Поиск по локации здания:</label>
        <input type="text" id="searchLocation" name="strLocation"/><br>

        <label for="searchPrice">Поиск по цене здания:</label>
        <input type="number" id="searchPrice" name="price"/><br>

        <div class="checkbox-wrapper">
            <label for="approvedSwitch">Одобрено:</label>
            <label class="switch">
                <input type="checkbox" id="approvedSwitch" name="approved">
                <span class="slider round"></span>
            </label>
        </div>

        <input type="submit" value="Поиск"/>
    </form>
    <div class="building-flex-container">
        <#list buildings as building>
            <#if building.user.id == user.id || user.isAdmin()>
                <!--реализованно при помощи freeMarker, buildings передаётся через buildings(Model model)-->
                <!--цикл for, проходимся по каждому зданию-->
                <div class="building-info">
                    <div class="image-container">
                        <#list building.images as img>
                            <#if img.isPreviewImage()>
                                <a href="/images/${img.id}" target="_blank">
                                    <img src="/images/${img.id}" height="250px">
                                </a>
                            </#if>
                        </#list>
                    </div>
                    <h4>Название: ${building.name}</h4>
                    <p>Расположение: ${building.strLocation}
                        <#if building.floor?trim != ''>, этаж ${building.floor}</#if>
                        <#if building.roomNo?trim != ''>, помещение ${building.roomNo}</#if>
                    </p>
                    <p>Тип помещения:
                        <#switch building.type>
                            <#case "BUILDING">
                                Отдельное здание
                                <#break>
                            <#case "MALL">
                                ТЦ, ТРЦ, ТРК
                                <#break>
                            <#case "FIRST_FLOOR">
                                Первый этаж МКД
                                <#break>
                            <#default>
                                Не указано
                        </#switch></p>
                    <p>Цена: ${building.price}</p>
                    <p>Владелец: ${building.user.name}</p>
                    <p>Описание: ${building.description}</p>
                    <#if building.approved>
                        <p>Статус: одобрено</p>
                    <#else>
                        <p>Статус: неодобрено</p>
                    </#if>
                    <form action="/building/${building.id}" method="get" class="login-form">
                        <input type="submit" value="Подробнее..." class="login-button"/>
                    </form>
                </div>
            <#else>
                <h3 class="search-error">Ничего не найдено</h3>
            </#if>
        </#list>
    </div>
    <#if user.username??>
        <h3 id="addRoomBtn" class="add">Внести новое помещение</h3>
        <!--Передаёт JSON методом POST, спринг получает и автоматически конверирует в Building-->
        <!--Передаёт Building в buildingCreate(Building building)-->
        <form id="addRoomForm" action="/building/create" method="post" class="buildings" enctype="multipart/form-data"
              onsubmit="return validateForm()" style="display: none;">
            <label for="name">Название:</label>
            <input type="text" id="name" name="name"/><br><br>

            <label for="strLocation">Расположение:</label>
            <input type="text" id="strLocation" name="strLocation"
                   placeholder="Страна, Регион, Город или Нас.пункт, Улица, Номер дома"/>
            <input type="button" id="detailedLocationBtn" class="getDetailedLocation" value="✓"
                   onclick="getDetailedLocation()">
            <br><br>
            <label id="locationLoading" hidden>Загрузка...</label>
            <br><br>
            <#--            <label for="useDetailedLocation">Уточнить адрес:</label>-->
            <#--            <input type="checkbox" id="useDetailedLocation" onchange="toggleInputFields()"/><br><br>-->
            <#--            <label for="detailedLocation">Адрес на карте:</label>-->
            <table id="detailedLocationTable">
                <tbody>
                <tr>
                    <td><label for="lat">Широта:</label>
                        <input type="number" id="lat" name="lat" step="any" readonly/></td>
                    <td><label for="lon">Долгота:</label>
                        <input type="number" id="lon" name="lon" step="any" readonly/></td>
                </tr>
                <tr>
                    <td><label for="country">Страна:</label>
                        <input type="text" id="country" name="country" readonly/></td>
                    <td><label for="state">Регион:</label>
                        <input type="text" id="state" name="state" readonly/></td>
                </tr>
                <tr>
                    <td><label for="county">Район:</label>
                        <input type="text" id="county" name="county" readonly/></td>
                    <td><label for="city">Город/Населённый пункт:</label>
                        <input type="text" id="city" name="city" readonly/></td>
                </tr>
                <tr>
                    <td><label for="road">Улица:</label>
                        <input type="text" id="road" name="road" readonly/></td>
                    <td><label for="buildingNo">Номер дома:</label>
                        <input type="text" id="buildingNo" name="buildingNo" readonly/></td>
                </tr>
                </tbody>
            </table>
            <br><br>

            <label for="floor">Этаж:</label>
            <input type="text" id="floor" name="floor" value=""/><br><br>
            <label for="roomNo">Номер помещения:</label>
            <input type="text" id="roomNo" name="roomNo" value=""/><br><br>
            <label for="type">Тип помещения:</label>
            <select id="type" name="type">
                <option value="NO_DATA">Не указано</option>
                <option value="BUILDING">Отдельное здание</option>
                <option value="MALL">ТЦ, ТРЦ, ТРК</option>
                <option value="FIRST_FLOOR">Первый этаж МКД</option>
            </select><br><br>

            <script>
                async function getDetailedLocation() {
                    document.getElementById('locationLoading').style.display = 'inline-block';
                    var strLocation = document.getElementById('strLocation').value;
                    const response = await fetch("https://nominatim.openstreetmap.org/search?format=json&addressdetails=1&q=" + strLocation);
                    const jsonLocation = await response.json();
                    if (jsonLocation.length < 1) {
                        alert("Здание с таким адресом не найдено")
                        return;
                    }
                    const location = jsonLocation[0];
                    document.getElementById('lat').value = location["lat"];
                    document.getElementById('lon').value = location["lon"];
                    const address = location["address"];
                    document.getElementById('country').value = address["country"] || "";
                    document.getElementById('state').value = address["state"] || "";
                    document.getElementById('county').value = address["county"] || "";
                    document.getElementById('road').value = address["road"] || "";
                    document.getElementById('buildingNo').value = address["house_number"] || "";

                    // достаём нас. пункт из адреса потому что в OSM дебильная система для этого
                    const properties = ["city", "town", "village", "hamlet", "allotments", "suburb"];
                    let cityValue = "";

                    for (let prop of properties) {
                        if (address[prop] !== undefined) {
                            cityValue = address[prop];
                            break;
                        }
                    }

                    document.getElementById('city').value = cityValue;
                    document.getElementById('locationLoading').style.display = 'none';
                }

                // function toggleInputFields() {
                //     var useDetailedLocation = document.getElementById('useDetailedLocation').checked;
                //     document.getElementById('strLocation').disabled = useDetailedLocation;
                //     document.getElementById('lat').disabled = !useDetailedLocation;
                //     document.getElementById('lon').disabled = !useDetailedLocation;
                //     document.getElementById('country').disabled = !useDetailedLocation;
                //     document.getElementById('state').disabled = !useDetailedLocation;
                //     document.getElementById('county').disabled = !useDetailedLocation;
                //     document.getElementById('city').disabled = !useDetailedLocation;
                //     document.getElementById('road').disabled = !useDetailedLocation;
                //     document.getElementById('buildingNo').disabled = !useDetailedLocation;
                //
                // }
            </script>

            <label for="price">Цена:</label>
            <input type="number" id="price" name="price"/><br><br>
            <label for="description">Описание:</label>
            <input type="text" id="description" name="description"/><br><br>
            <label for="frontFile">Фасад:</label>
            <input type="file" id="frontFile" name="frontFile" accept=".jpg, .jpeg, .png, .gif" multiple
                   onchange="checkFiles(this)" max="5"><br><br>
            <label for="entranceFile">Вход:</label>
            <input type="file" id="entranceFile" name="entranceFile" accept=".jpg, .jpeg, .png, .gif" multiple
                   onchange="checkFiles(this)" max="5"><br><br>
            <label for="interiorFile">Интерьер:</label>
            <input type="file" id="interiorFile" name="interiorFile" accept=".jpg, .jpeg, .png, .gif" multiple
                   onchange="checkFiles(this)" max="5"><br><br>
            <input type="submit" value="Добавить помещение"/>
        </form>
    <#else>
        <h4 class="alt-login">
            <a href="/login" style="text-decoration: none; color: inherit;">Войдите в аккаунт, чтобы добавить
                помещение</a>
        </h4>
    </#if>
    <script>
        // Функция, которая отображает или скрывает форму при нажатии на кнопку "Внести новое помещение"
        document.getElementById('addRoomBtn').addEventListener('click', function () {
            var addRoomForm = document.getElementById('addRoomForm');
            if (addRoomForm.style.display === 'none') {
                addRoomForm.style.display = 'block'; // Показываем форму
            } else {
                addRoomForm.style.display = 'none'; // Скрываем форму
            }
        });
    </script>
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
    // список мапов с данными о зданиях
    var mapBuildings = [
        <#list buildings as building>
        <#if building.user.id == user.id || user.isAdmin()>
        {
            id: ${building.id},
            name: "${building.name}",
            strLocation: "${building.strLocation}",
            lat: ${building.lat?cn},
            lon: ${building.lon?cn},
            price: "${building.price}",
            username: "${building.user.username}",
            description: "${building.description}"
        }<#sep>,
        </#if>
        </#list>
    ];

    for (var i = 0; i < mapBuildings.length; i++) {
        makeMarker(mapBuildings[i]);
    }

    function makeMarker(building) {
        L.marker([building.lat, building.lon]).addTo(map)
            .bindPopup(
                '<h3>' + building["name"] + '</h3>' + building["strLocation"] + '<br><form action="/building/'
                + building.id + '" method="get" class="login-form"><input type="submit" value="Подробнее..." class="login-button"/></form>'
            );
    }
</script>
</body>
</html>