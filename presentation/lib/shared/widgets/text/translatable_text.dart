import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/entities/common/locale.dart';
import 'package:verbeelding_verbindt_core/services/localization_service.dart';

final serviceLocator = GetIt.instance;

typedef TranslatedTextCallback = String Function(
  BuildContext context,
  LocaleEntity locale,
);

class TranslatedText extends StatelessWidget {
  final TranslatedTextCallback translationCallback;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// If non-null, the style to use for this text.
  ///
  /// If the style's "inherit" property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  final TextStyle? style;

  /// How visual overflow should be handled.
  ///
  /// Defaults to retrieving the value from the nearest [DefaultTextStyle] ancestor.
  final TextOverflow? overflow;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int? maxLines;

  final bool debug;

  const TranslatedText(
    this.translationCallback, {
    this.textAlign,
    this.style,
    this.overflow,
    this.maxLines,
    this.debug = false,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return StreamBuilder<LocaleEntity>(
      stream: serviceLocator<LocalizationService>().locale,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        final translation = translationCallback(
          context,
          snapshot.data!,
        );
        return Text(
          translation,
          textAlign: textAlign,
          style: style,
          overflow: overflow,
          maxLines: maxLines,
        );
      },
    );
  }
}
