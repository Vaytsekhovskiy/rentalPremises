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
