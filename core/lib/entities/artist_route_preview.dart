import 'package:equatable/equatable.dart';

import '../entities/image.dart';
import '../entities/translatable_string.dart';

class ArtistRoutePreviewEntity extends Equatable {
  const ArtistRoutePreviewEntity({
    required this.text,
    required this.images,
  });

  final TranslatableStringEntity text;
  final List<ImageEntity> images;

  @override
  List<Object?> get props => [
        text,
        images.hashCode,
      ];
}
