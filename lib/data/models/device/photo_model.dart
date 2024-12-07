import 'package:tomato_leaf/data/models/device/prediction_model.dart';
import 'package:tomato_leaf/domain/entities/device/photo_entity.dart';

class PhotoModel {
  final String? createdAt;
  final String? id;
  final String? photoUrl;
  final List<PredictionModel>? predictions;
  final String? updatedAt;

  PhotoModel({
    this.createdAt,
    this.id,
    this.photoUrl,
    this.predictions,
    this.updatedAt,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      createdAt: json['createdAt'] as String?,
      id: json['id'] as String?,
      photoUrl: json['photoUrl'] as String?,
      predictions: json['predictions'] != null
          ? PredictionModel.fromListJson(json['predictions'])
          : [],
      updatedAt: json['updatedAt'] as String?,
    );
  }

  static List<PhotoModel> fromListJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) => PhotoModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'id': id,
      'photoUrl': photoUrl,
      'predictions': predictions?.map((e) => e.toJson()).toList(),
      'updatedAt': updatedAt,
    };
  }

  PhotoEntity toEntity() {
    return PhotoEntity(
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      id: id,
      photoUrl: photoUrl,
      predictions: predictions?.map((e) => e.toEntity()).toList(),
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
    );
  }

  static PhotoModel fromEntity(PhotoEntity entity) {
    return PhotoModel(
      createdAt: entity.createdAt?.toIso8601String(),
      id: entity.id,
      photoUrl: entity.photoUrl,
      predictions: entity.predictions?.map((e) => PredictionModel.fromEntity(e)).toList(),
      updatedAt: entity.updatedAt?.toIso8601String(),
    );
  }
}
