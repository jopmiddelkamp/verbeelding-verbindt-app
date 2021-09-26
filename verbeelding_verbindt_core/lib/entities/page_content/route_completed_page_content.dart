import 'package:equatable/equatable.dart';

import '../common/image.dart';
import '../common/translatable_string.dart';

class RouteCompletedPageContentEntity extends Equatable {
  const RouteCompletedPageContentEntity({
    required this.headerImage,
    required this.text,
  });

  final ImageEntity headerImage;
  final TranslatableStringEntity text;

  @override
  List<Object?> get props => [
        headerImage,
        text,
      ];
}
