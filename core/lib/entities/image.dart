import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  const ImageEntity({
    required this.blurhash,
    required this.url,
  });

  final String blurhash;
  final String url;

  @override
  List<Object> get props => [blurhash, url];
}
