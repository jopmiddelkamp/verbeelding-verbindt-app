import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class ArtistRouteDetails extends Equatable {
  const ArtistRouteDetails({
    required this.video,
    required this.text,
    required this.images,
  });

  final YoutubeVideo video;
  final TranslatableString text;
  final List<Image> images;

  @override
  List<Object?> get props => [
        video,
        text,
        images.hashCode,
      ];
}
