import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/entities/common/route_stop.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';
import '../../scan_qr/scan_qr_page.dart';
import '../guide_cubit.dart';
import '../guide_state.dart';

class ScanQrButton extends StatelessWidget {
  const ScanQrButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<GuideCubit, GuideState>(
      buildWhen: (previous, current) {
        return previous.currentStop != current.currentStop;
      },
      builder: (context, state) {
        return TextButton(
          child: TranslatedText(
            (c, _) => c.l10n.guidePage.scanQr,
          ),
          onPressed: state.routeLoaded
              ? () => _onPressed(context, state.currentStop!)
              : null,
        );
      },
    );
  }

  Future _onPressed(
    BuildContext context,
    RouteStopEntity currentStop,
  ) async {
    final result = await context.navigator.pushNamed<bool>(
      ScanQrPage.routeName,
      arguments: ScanQrPageArguments(
        currentArtistId: currentStop.artist.id!,
      ),
    );
    if (result == true) {
      context.blocProvider<GuideCubit>().next();
    }
  }
}
