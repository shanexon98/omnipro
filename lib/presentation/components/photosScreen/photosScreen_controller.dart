// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebaomnipro/data/services/photo_service.dart';

import '../../../data/models/photo.dart';

class PhotosController extends GetxController {
  final _photos = <Photo>[].obs;
  final _currentPage = 0.obs;
  final _isLoading = true.obs;
  final isLoadingInfiniteScroll = false.obs;
  final _hasError = false.obs;
  final photoService = PhotoService();

  final ScrollController scrollController = ScrollController();
  List<Photo> get photos => _photos;
  int get currentPage => _currentPage.value;
  bool get isLoading => _isLoading.value;
  bool get hasError => _hasError.value;

  @override
  void onInit() {
    super.onInit();

    getPhotos();
    scrollController.addListener(() async {
      final maxScrollEvent = scrollController.position.maxScrollExtent - 10;
      final offSet = scrollController.offset;

      if (offSet > maxScrollEvent && !isLoadingInfiniteScroll.value) {
        isLoadingInfiniteScroll.value = true;
        _currentPage.value++;
        await getPhotos();
        isLoadingInfiniteScroll.value = false;
      }
    });
  }

  getPhotos() async {
    var photo = await photoService.fetchPhotos(currentPage);
    _photos.addAll(photo);
    _isLoading.value = false;
    update(['photo']);
  }
}
