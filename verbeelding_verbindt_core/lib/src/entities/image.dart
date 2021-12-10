import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class ImageGeoLocation extends Equatable {
  const ImageGeoLocation({
    required this.blurhash,
    required this.url,
    required this.size,
  });

  final String blurhash;
  final String url;
  final SizeGeoLocation size;

  @override
  List<Object?> get props => [
        blurhash,
        url,
        size,
      ];
}
