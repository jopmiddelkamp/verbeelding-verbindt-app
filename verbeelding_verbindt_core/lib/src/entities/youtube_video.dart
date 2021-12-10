import 'package:equatable/equatable.dart';

class YoutubeVideoGeoLocation extends Equatable {
  const YoutubeVideoGeoLocation({
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
