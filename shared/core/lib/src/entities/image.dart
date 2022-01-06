import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class Image extends Equatable {
  const Image({
    required this.blurhash,
    required this.url,
    required this.size,
  });

  final String blurhash;
  final String url;
  final Size size;

  @override
  List<Object?> get props => [
        blurhash,
        url,
        size,
      ];
}
