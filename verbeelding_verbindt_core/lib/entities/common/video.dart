import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  const VideoEntity({
    required this.aspectRatio,
    required this.url,
  });

  final double aspectRatio;
  final String url;

  @override
  List<Object?> get props => [
        aspectRatio,
        url,
      ];
}
