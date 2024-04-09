<!DOCTYPE html>
<html>
<head>
    <title>RENTAL PREMISES</title>
</head>
<body>
<h1>RENTAL PREMISES</h1><hr>
<h3>Подробная информация о пользователе ${user.name}</h3>
<b>Номер телефона: </b> ${user.numberPhone}<br>
<b>Email: </b> ${user.username}<br>
<b>ИНН: </b> ${user.inn}<br>
<h4>Арендные помещения пользователя ${user.name}</h4>
<#list buildings as building>
    <div>
        <p><b>${building.name}</b> ${building.price} руб. | <a href="/building/${building.id}">Подробнее...</a></p>
    </div>
<#else>
    <h3>У пользователя нет арендных помещений</h3>
</#list>
<#--<#if errorMessage??>-->
<#--    <h2 style="color: red">${errorMessage}</h2>-->
<#--</#if>-->
</body>
</html>