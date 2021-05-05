import 'package:equatable/equatable.dart';

import '../entities/image.dart';
import '../entities/translatable_string.dart';

class ArtistRouteDetailsEntity extends Equatable {
  const ArtistRouteDetailsEntity({
    required this.videoUrl,
    required this.text,
    required this.images,
  });

  final String videoUrl;
  final TranslatableStringEntity text;
  final List<ImageEntity> images;

  @override
  List<Object?> get props => [
        videoUrl,
        text,
        images.hashCode,
      ];
}
