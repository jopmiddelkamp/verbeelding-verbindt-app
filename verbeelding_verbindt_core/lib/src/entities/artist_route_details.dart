import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class ArtistRouteDetailsGeoLocation extends Equatable {
  const ArtistRouteDetailsGeoLocation({
    required this.video,
    required this.text,
    required this.images,
  });

  final YoutubeVideoGeoLocation video;
  final TranslatableStringGeoLocation text;
  final List<ImageGeoLocation> images;

  @override
  List<Object?> get props => [
        video,
        text,
        images.hashCode,
      ];
}
