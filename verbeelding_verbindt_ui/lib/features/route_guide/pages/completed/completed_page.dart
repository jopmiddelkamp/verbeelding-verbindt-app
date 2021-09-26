import 'package:flutter/material.dart';

import '../../../../shared/dialogs/confirm/confirm_dialog.dart';
import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/widgets/text/translatable_markdown.dart';
import 'widgets/header.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({Key? key}) : super(key: key);

  static const String routeName = 'route_guide_completed';

  @override
  Widget build(
    BuildContext context,
  ) {
    return WillPopScope(
      onWillPop: () {
        return showConfirmDialog(
          context,
          content: (c, _) => c.l10n.completedPage.popConfirmMessage,
        );
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        const Header(),
        Expanded(
          child: TranslatedMarkdown(
            (c, _) => c.l10n.completedPage.text,
            padding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
