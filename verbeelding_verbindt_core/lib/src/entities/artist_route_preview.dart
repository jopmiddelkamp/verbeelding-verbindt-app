import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class ArtistRoutePreviewGeoLocation extends Equatable {
  const ArtistRoutePreviewGeoLocation({
    required this.text,
  });

  final TranslatableStringGeoLocation text;

  @override
  List<Object?> get props => [
        text,
      ];
}
