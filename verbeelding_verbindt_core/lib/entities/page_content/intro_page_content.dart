import 'package:equatable/equatable.dart';

import '../common/image.dart';
import '../common/translatable_string.dart';

class IntroPageContentEntity extends Equatable {
  const IntroPageContentEntity({
    required this.headerImage,
    required this.title,
    required this.text,
  });

  final ImageEntity headerImage;
  final TranslatableStringEntity title;
  final TranslatableStringEntity text;

  @override
  List<Object?> get props => [
        headerImage,
        title,
        text,
      ];
}
