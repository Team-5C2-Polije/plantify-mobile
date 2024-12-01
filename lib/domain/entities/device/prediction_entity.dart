class PredictionEntity {
  final String? className;
  final double? confidence;
  final int? height;
  final int? width;
  final double? x;
  final double? y;

  PredictionEntity({
    this.className,
    this.confidence,
    this.height,
    this.width,
    this.x,
    this.y,
  });
}
