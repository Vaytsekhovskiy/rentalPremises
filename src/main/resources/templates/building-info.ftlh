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
    <form action="/building/delete/${building.id}" method="post" class="login-button">
        <input type="submit" value="Удалить помещение"/>
    </form>
</div>
</body>
</html>