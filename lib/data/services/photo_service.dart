import 'dart:convert';

import 'package:get/get.dart';

import '../models/photo.dart';
import 'package:http/http.dart' as http;

class PhotoService {
  Future<List<Photo>> fetchPhotos(currentPage) async {
    String urlApi =
        'https://jsonplaceholder.typicode.com/photos?_start=${currentPage * 10}&_limit=10';
    try {
      final response = await http.get(Uri.parse(urlApi));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Photo> photos =
            data.map((dynamic item) => Photo.fromJson(item)).toList();

        return photos;
      }
      if (response.statusCode == 400) {
        Get.snackbar('Atención', 'Error al cargar la información.');
      }
      if (response.statusCode == 500) {
        Get.snackbar('Atención', 'Error del servidor intente más tarde.');
      }
    } catch (e) {
      Get.snackbar('ERROR', e.toString());
    }
    return [];
  }
}
