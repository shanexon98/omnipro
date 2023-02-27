// ignore: file_names
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../app/utils/assets_util.dart';
import './photosScreen_controller.dart';
import 'package:pruebaomnipro/data/models/photo.dart';

class PhotosScreenPage extends GetView<PhotosController> {
  const PhotosScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoController = Get.put(PhotosController());

    return Scaffold(
      body: Obx(
        () => photoController.isLoading
            ? Center(
                child: Image.asset(
                  Assets.loadingSpinner,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 8, right: 8),
                child: Column(
                  children: [
                    Image.asset(
                      Assets.logo,
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: photoController.scrollController,
                        itemCount: photoController.photos.length,
                        itemBuilder: (context, index) {
                          var photo = photoController.photos[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: containerData(photo),
                          );
                        },
                      ),
                    ),
                    photoController.isLoadingInfiniteScroll.value
                        ? Center(
                            child: Image.asset(
                              Assets.loadingSpinner,
                              width: 50,
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
      ),
    );
  }

  Container containerData(Photo photo) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 228, 228, 228),
          borderRadius: BorderRadius.circular(25)),
      child: ListTile(
        leading: Image.network(
          photo.thumbnailUrl,
          width: 50,
          height: 50,
        ),
        title: Text(photo.title),
        subtitle: Text('ID: ${photo.id}'),
      ),
    );
  }
}
