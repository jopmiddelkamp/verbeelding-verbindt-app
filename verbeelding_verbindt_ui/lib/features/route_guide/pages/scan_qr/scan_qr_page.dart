import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:verbeelding_verbindt_ui/shared/validators/qr_barcode_validator.dart';

import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/widgets/bloc/failure_state_display.dart';
import '../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import 'bloc/bloc.dart';

class ScanQrPage extends StatelessWidget {
  const ScanQrPage._();

  static Widget bloc(
    ScanQrPageArguments arguments,
  ) {
    return BlocProvider(
      create: (_) => ScanQrCubit(
        qrCodeValidator: QrCodeValidator(
          expected: arguments.currentArtistId,
        ),
      ),
      child: BlocListener<ScanQrCubit, ScanQrState>(
        listener: (context, state) {
          if (state is ScanQrValidScan) {
            context.navigator.pop(true);
          } else if (state is ScanQrInvalidScan) {
            context.scaffoldMessenger.showSnackBar(
              const SnackBar(
                content: Text(
                  'U heeft een ongeldige QR code gescand. Probeer het a.u.b. opnieuw.',
                ),
              ),
            );
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
      key: GlobalKey(debugLabel: '$ScanQrPage$QRView'),
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
