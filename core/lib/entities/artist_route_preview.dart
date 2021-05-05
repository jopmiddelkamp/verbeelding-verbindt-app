import 'package:equatable/equatable.dart';

import '../entities/translatable_string.dart';

class ArtistRoutePreviewEntity extends Equatable {
  const ArtistRoutePreviewEntity({
    required this.text,
  });

  final TranslatableStringEntity text;

  @override
  List<Object?> get props => [
        text,
      ];
}
