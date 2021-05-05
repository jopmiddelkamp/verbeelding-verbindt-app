import 'package:equatable/equatable.dart';

import 'size.dart';

class ImageEntity extends Equatable {
  const ImageEntity({
    required this.blurhash,
    required this.url,
    required this.size,
  });

  final String blurhash;
  final String url;
  final SizeEntity size;

  @override
  List<Object> get props => [
        blurhash,
        url,
        size,
      ];
}
