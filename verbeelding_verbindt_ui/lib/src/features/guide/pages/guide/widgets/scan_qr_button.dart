import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class GuidePageScanQrButton extends StatelessWidget {
  const GuidePageScanQrButton({
    Key? key,
    required this.stop,
  }) : super(key: key);

  final RouteStopEntity stop;

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextButton(
      child: Text(
        context.l10n.pageGuideScanQr,
      ),
      onPressed: () async => await _onPressed(
        context,
      ),
    );
  }

  Future<void> _onPressed(
    BuildContext context,
  ) async {
    final result = await ScanQrPage.push(
      context,
      arguments: ScanQrPageArguments(
        currentArtistId: stop.artist.id!,
      ),
    );
    if (result == true) {
      context.read<GuideCubit>().next();
    }
  }
}
