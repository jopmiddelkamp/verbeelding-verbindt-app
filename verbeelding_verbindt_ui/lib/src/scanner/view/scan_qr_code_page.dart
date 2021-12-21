import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

abstract class ScanQrCodePage extends StatefulWidget {
  ScanQrCodePage({
    required this.cubitBuilder,
    GlobalKey? qrCodeKey,
    Key? key,
  })  : qrCodeKey = qrCodeKey ?? GlobalKey(debugLabel: 'SCAN_QR_KEY'),
        super(key: key);

  final ScanQrCodeCubit Function(BuildContext) cubitBuilder;
  final GlobalKey qrCodeKey;

  static const String name = 'scan_qr_code';

  static void go(BuildContext context) => context.goNamed(name);

  @override
  State<ScanQrCodePage> createState() => _ScanQrCodePageState();
}

class _ScanQrCodePageState extends State<ScanQrCodePage> {
  late GlobalKey qrCodeKey;

  @override
  void initState() {
    super.initState();
    qrCodeKey = widget.qrCodeKey;
  }

  BlocProvider<ScanQrCodeCubit> _blocProvider(
    WidgetBuilder builder,
  ) {
    return BlocProvider(
      create: widget.cubitBuilder,
      child: Builder(builder: builder),
    );
  }

  void _listener(
    BuildContext context,
    ScanQrCodeState state,
  ) {
    state.mapOrNull(
      invalidParams: (_) {
        context.scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(
              'De scan pagina is onbereikbaar met de opgegeven parameters.',
            ),
          ),
        );
        debugPrint('### ScanQrCodePage.invalidParams: pop()');
        context.pop();
      },
      processed: (_) {
        debugPrint('### ScanQrCodePage.processed: pop()');
        context.pop();
      },
      invalidScan: (value) {
        context.scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text(
              'U heeft een ongeldige QR code gescand. Probeer het a.u.b. opnieuw.',
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return _blocProvider((context) {
      return BlocListener<ScanQrCodeCubit, ScanQrCodeState>(
        listener: _listener,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: BlocBuilder<ScanQrCodeCubit, ScanQrCodeState>(
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
        ),
      );
    });
  }

  Widget _buildLoadingOverlay(
    BuildContext context,
  ) {
    return Container(
      color: context.theme.colorScheme.background,
      child: Center(
        child: VVCircleLoadingIndicator(
          text: context.l10n.pageScanQrBusyLoadingCamera,
        ),
      ),
    );
  }

  Widget _buildQrView(
    BuildContext context,
  ) {
    return QRView(
      key: qrCodeKey,
      onQRViewCreated: (controller) {
        final cubit = context.read<ScanQrCodeCubit>();
        cubit.setQrController(controller);
      },
    );
  }
}
