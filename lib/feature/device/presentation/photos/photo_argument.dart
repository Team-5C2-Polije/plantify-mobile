import 'package:tomato_leaf/domain/entities/device/photo_entity.dart';

class PhotoArgument {
  final String deviceId;
  final int index;
  final List<PhotoEntity> photos;

  PhotoArgument({
    required this.deviceId,
    required this.index,
    required this.photos,
  });
}
