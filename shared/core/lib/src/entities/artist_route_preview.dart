import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class ArtistRoutePreview extends Equatable {
  const ArtistRoutePreview({
    required this.text,
  });

  final TranslatableString text;

  @override
  List<Object?> get props => [
        text,
      ];
}
