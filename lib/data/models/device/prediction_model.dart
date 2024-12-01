import 'package:tomato_leaf/domain/entities/device/prediction_entity.dart';

class PredictionModel {
  final String? className;
  final double? confidence;
  final int? height;
  final int? width;
  final double? x;
  final double? y;

  PredictionModel({
    this.className,
    this.confidence,
    this.height,
    this.width,
    this.x,
    this.y,
  });

  factory PredictionModel.fromJson(String key, dynamic value) {
    return PredictionModel(
      className: value['class'] as String?,
      confidence: (value['confidence'] as num?)?.toDouble(),
      height: value['height'] as int?,
      width: value['width'] as int?,
      x: (value['x'] as num?)?.toDouble(),
      y: (value['y'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'class': className,
      'confidence': confidence,
      'height': height,
      'width': width,
      'x': x,
      'y': y,
    };
  }

  PredictionEntity toEntity() {
    return PredictionEntity(
      className: className,
      confidence: confidence,
      height: height,
      width: width,
      x: x,
      y: y,
    );
  }

  static PredictionModel fromEntity(PredictionEntity entity) {
    return PredictionModel(
      className: entity.className,
      confidence: entity.confidence,
      height: entity.height,
      width: entity.width,
      x: entity.x,
      y: entity.y,
    );
  }
}
