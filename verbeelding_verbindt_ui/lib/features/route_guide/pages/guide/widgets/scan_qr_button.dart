import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/entities/common/route_stop.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';
import '../../../blocs/route/bloc.dart';
import '../../scan_qr/scan_qr_page.dart';

class ScanQrButton extends StatelessWidget {
  const ScanQrButton({
    Key? key,
    required this.stop,
  }) : super(key: key);

  final RouteStopEntity stop;

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextButton(
      child: TranslatedText(
        (c, _) => c.l10n.guidePage.scanQr,
      ),
      onPressed: () async => await _onPressed(
        context,
      ),
    );
  }

  Future<void> _onPressed(
    BuildContext context,
  ) async {
    final result = await context.navigator.pushNamed<bool>(
      ScanQrPage.routeName,
      arguments: ScanQrPageArguments(
        currentArtistId: stop.artist.id!,
      ),
    );
    if (result == true) {
      context.cubit<RouteCubit>().next();
    }
  }
}
