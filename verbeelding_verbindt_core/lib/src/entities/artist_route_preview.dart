import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

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
