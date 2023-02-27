import 'package:flutter_test/flutter_test.dart';
import 'package:pruebaomnipro/data/services/photo_service.dart';

void main() {
  group('PhotoService', () {
    test('returns a list of photos', () async {
      final photoService = PhotoService();
      final photos = await photoService.fetchPhotos(0);

      expect(photos, isList);
      expect(photos.isNotEmpty, isTrue);
    });
  });
}
