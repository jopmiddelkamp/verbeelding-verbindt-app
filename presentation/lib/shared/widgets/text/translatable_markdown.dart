import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/entities/common/locale.dart';
import 'package:verbeelding_verbindt_core/services/localization_service.dart';

import '../../extensions/build_context_extensions.dart';
import 'translatable_text.dart';

final serviceLocator = GetIt.instance;

class TranslatedMarkdown extends StatelessWidget {
  final TranslatedTextCallback translationCallback;

  final EdgeInsets? padding;

  const TranslatedMarkdown(
    this.translationCallback, {
    this.padding,
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

        return Markdown(
          data: translation,
          // Because of bug in Markdown we have to define the default  our selfs
          padding: padding ?? const EdgeInsets.all(16.0),
          styleSheet: _buildMarkdownStyleSheet(context.theme),
        );
      },
    );
  }

  MarkdownStyleSheet _buildMarkdownStyleSheet(
    ThemeData theme,
  ) {
    assert(theme.textTheme.bodyText2?.fontSize != null);
    return MarkdownStyleSheet(
      a: const TextStyle(color: Colors.blue),
      p: theme.textTheme.bodyText2,
      code: theme.textTheme.bodyText2!.copyWith(
        backgroundColor: theme.cardTheme.color ?? theme.cardColor,
        fontFamily: "monospace",
        fontSize: theme.textTheme.bodyText2!.fontSize! * 0.85,
      ),
      h1: theme.textTheme.headline1,
      h2: theme.textTheme.headline2,
      h3: theme.textTheme.headline3,
      h4: theme.textTheme.headline4,
      h5: theme.textTheme.headline5,
      h6: theme.textTheme.headline6,
      em: const TextStyle(fontStyle: FontStyle.italic),
      strong: const TextStyle(fontWeight: FontWeight.bold),
      del: const TextStyle(decoration: TextDecoration.lineThrough),
      blockquote: theme.textTheme.bodyText2,
      img: theme.textTheme.bodyText2,
      checkbox: theme.textTheme.bodyText2!.copyWith(
        color: theme.primaryColor,
      ),
      blockSpacing: 8.0,
      listIndent: 24.0,
      listBullet: theme.textTheme.bodyText2,
      listBulletPadding: const EdgeInsets.only(right: 4),
      tableHead: const TextStyle(fontWeight: FontWeight.w600),
      tableBody: theme.textTheme.bodyText2,
      tableHeadAlign: TextAlign.center,
      tableBorder: TableBorder.all(
        color: theme.dividerColor,
        width: 1,
      ),
      tableColumnWidth: const FlexColumnWidth(),
      tableCellsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      tableCellsDecoration: const BoxDecoration(),
      blockquotePadding: const EdgeInsets.all(8.0),
      blockquoteDecoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(2.0),
      ),
      codeblockPadding: const EdgeInsets.all(8.0),
      codeblockDecoration: BoxDecoration(
        color: theme.cardTheme.color ?? theme.cardColor,
        borderRadius: BorderRadius.circular(2.0),
      ),
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 5.0,
            color: theme.dividerColor,
          ),
        ),
      ),
    );
  }
}
