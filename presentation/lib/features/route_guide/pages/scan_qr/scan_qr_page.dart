import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import 'scan_qr_cubit.dart';
import 'scan_qr_state.dart';

final serviceLocator = GetIt.instance;

class ScanQrPage extends StatelessWidget {
  const ScanQrPage._();

  static Widget blocProvider(
    ScanQrPageArguments arguments,
  ) {
    return BlocProvider(
      create: (context) {
        return ScanQrCubit(arguments);
      },
      child: BlocListener<ScanQrCubit, ScanQrState>(
        listener: (context, state) {
          if (state.validScan) {
            context.navigator.pop(true);
          }
        },
        child: const ScanQrPage._(),
      ),
    );
  }

  static const String routeName = 'route_guide/scan_qr';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR code'),
      ),
      body: BlocBuilder<ScanQrCubit, ScanQrState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (!state.loaded)
                Positioned.fill(
                  child: _buildLoadingOverlay(context),
                ),
              Positioned.fill(
                child: _buildQrView(context, state),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoadingOverlay(
    BuildContext context,
  ) {
    return Container(
      color: context.theme.colorScheme.background,
      child: Center(
        child: const VVCircleLoadingIndicator(
          label: 'Bezig met laden van de camera..',
        ),
      ),
    );
  }

  Widget _buildQrView(
    BuildContext context,
    ScanQrState state,
  ) {
    return QRView(
      key: state.qrKey,
      onQRViewCreated: (controller) {
        final cubit = context.blocProvider<ScanQrCubit>();
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
