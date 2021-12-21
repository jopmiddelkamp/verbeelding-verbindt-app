import 'package:equatable/equatable.dart';

class YoutubeVideo extends Equatable {
  const YoutubeVideo({
    required this.aspectRatio,
    required this.videoId,
  });

  final double aspectRatio;
  final String videoId;

  @override
  List<Object?> get props => [
        aspectRatio,
        videoId,
      ];
}
