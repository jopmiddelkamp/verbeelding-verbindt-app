import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:verbeelding_verbindt_presentation/shared/utils/artist_id_utils.dart';

import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/widgets/bloc/failure_state_display.dart';
import '../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../blocs/scan_qr/scan_qr_cubit.dart';
import '../../blocs/scan_qr/scan_qr_state.dart';

class ScanQrPage extends StatelessWidget {
  const ScanQrPage._();

  static Widget blocProvider(
    ScanQrPageArguments arguments,
  ) {
    return BlocProvider(
      create: (_) => ScanQrCubit(
        validator: (barcode) {
          return ArtistIdUtils.parse(barcode) != null;
        },
      ),
      child: BlocListener<ScanQrCubit, ScanQrState>(
        listener: (context, state) {
          if (state is ScanQrValidScan) {
            context.navigator.pop(true);
          }
        },
        child: const ScanQrPage._(),
      ),
    );
  }

  static const String routeName = 'route_guide_scan_qr';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<ScanQrCubit, ScanQrState>(
        buildWhen: _buildWhen,
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: state.maybeMap(
                  initializing: (_) => _buildLoadingOverlay(context),
                  failed: (_) => const FailureStateDisplay(),
                  orElse: () => Container(),
                ),
              ),
              Positioned.fill(
                child: _buildQrView(context),
              ),
            ],
          );
        },
      ),
    );
  }

  bool _buildWhen(
    ScanQrState previous,
    ScanQrState current,
  ) {
    return previous.runtimeType != current.runtimeType;
  }

  Widget _buildLoadingOverlay(
    BuildContext context,
  ) {
    return Container(
      color: context.theme.colorScheme.background,
      child: Center(
        child: VVCircleLoadingIndicator(
          text: (c, _) => c.l10n.scanQrPage.busyLoadingCamera,
        ),
      ),
    );
  }

  Widget _buildQrView(
    BuildContext context,
  ) {
    return QRView(
      key: ValueKey('$QRView'),
      onQRViewCreated: (controller) {
        final cubit = context.cubit<ScanQrCubit>();
        cubit.setQrController(controller);
      },
    );
  }
}

class ScanQrPageArguments {
  const ScanQrPageArguments({
    required this.currentArtistId,
  });

  final String currentArtistId;
}
