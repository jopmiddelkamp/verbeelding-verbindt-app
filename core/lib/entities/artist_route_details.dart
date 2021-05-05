import 'package:equatable/equatable.dart';

import '../entities/image.dart';
import '../entities/translatable_string.dart';
import 'video.dart';

class ArtistRouteDetailsEntity extends Equatable {
  const ArtistRouteDetailsEntity({
    required this.video,
    required this.text,
    required this.images,
  });

  final VideoEntity video;
  final TranslatableStringEntity text;
  final List<ImageEntity> images;

  @override
  List<Object?> get props => [
        video,
        text,
        images.hashCode,
      ];
}
