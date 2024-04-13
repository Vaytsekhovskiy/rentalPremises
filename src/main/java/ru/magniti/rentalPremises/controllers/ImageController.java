package ru.magniti.rentalPremises.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import ru.magniti.rentalPremises.models.Image;
import ru.magniti.rentalPremises.repositories.ImageRepository;

import java.io.ByteArrayInputStream;

// Данный класс взаимодействует с таблицей Image в БД
@RestController // Rest, т.к. мы не возвращаем html
@RequiredArgsConstructor
public class ImageController {
    private final ImageRepository imageRepository;

    // возвращаем фотографию
    @GetMapping("/images/{id}")
    private ResponseEntity<?> getImageById(@PathVariable Long id) {
        Image image = imageRepository.findById(id).orElse(null);
        assert image != null;
        return ResponseEntity.ok()
                .contentType(MediaType.valueOf(image.getContentType()))
                .contentLength(image.getSize())
                .body(new InputStreamResource(new ByteArrayInputStream(image.getBytes())));
    }
}
