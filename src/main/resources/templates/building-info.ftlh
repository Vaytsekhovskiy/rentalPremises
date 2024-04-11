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

    </style>

</head>
<body>
<div class="container">
    <h2 class="heading">
        <a href="/" style="text-decoration: none; color: inherit;">RENTAL PREMISES</a>
    </h2>
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
    <form action="/building/delete/${building.id}" method="post" class="login-button">
        <input type="submit" value="Удалить помещение"/>
    </form>
</div>
</body>
</html>