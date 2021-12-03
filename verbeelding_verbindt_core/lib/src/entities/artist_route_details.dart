import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class ArtistRouteDetailsEntity extends Equatable {
  const ArtistRouteDetailsEntity({
    required this.video,
    required this.text,
    required this.images,
  });

  final YoutubeVideoEntity video;
  final TranslatableStringEntity text;
  final List<ImageEntity> images;

  @override
  List<Object?> get props => [
        video,
        text,
        images.hashCode,
      ];
}
