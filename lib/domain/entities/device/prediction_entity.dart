class PredictionEntity {
  final String? label;
  final double? confidence;
  final num? height;
  final num? width;
  final num? x;
  final num? y;

  PredictionEntity({
    this.label,
    this.confidence,
    this.height,
    this.width,
    this.x,
    this.y,
  });
}
