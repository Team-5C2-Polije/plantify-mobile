import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/domain/entities/device/prediction_entity.dart';

class PredictionModel {
  final String? label;
  final num? height;
  final num? width;
  final num? x;
  final num? y;

  PredictionModel({
    this.label,
    this.height,
    this.width,
    this.x,
    this.y,
  });

  factory PredictionModel.fromJson(dynamic value) {
    return PredictionModel(
      label: value['label'] as String?,
      height: value['height'] as num?,
      width: value['width'] as num?,
      x: value['x'] as num?,
      y: value['y'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'class': label,
      'height': height,
      'width': width,
      'x': x,
      'y': y,
    };
  }

  PredictionEntity toEntity() {
    return PredictionEntity(
      label: label,
      height: height,
      width: width,
      x: x,
      y: y,
    );
  }

  static PredictionModel fromEntity(PredictionEntity entity) {
    return PredictionModel(
      label: entity.label,
      height: entity.height,
      width: entity.width,
      x: entity.x,
      y: entity.y,
    );
  }

  static List<PredictionModel> fromListJson(List<dynamic> jsonList) {
    return jsonList.map((item) {
      return PredictionModel.fromJson(item);
    }).toList();
  }
}