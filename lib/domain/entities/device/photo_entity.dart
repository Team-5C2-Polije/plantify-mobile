import 'prediction_entity.dart';

class PhotoEntity {
  final DateTime? createdAt;
  final String? id;
  final String? photoUrl;
  final String? from;
  final List<PredictionEntity>? predictions;
  final DateTime? updatedAt;

  PhotoEntity({
    this.createdAt,
    this.id,
    this.photoUrl,
    this.from,
    this.predictions,
    this.updatedAt,
  });
}
