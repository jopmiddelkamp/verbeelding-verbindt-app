import 'package:flutter/material.dart';

import '../../../../../../shared/presentation/extensions/build_context_extensions.dart';
import '../../scan_qr/scan_qr_page.dart';
import '../guide_bloc.dart';

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
    return TextButton(
      child: Text('Scan QR'),
      onPressed: () async {
        final result = await context.navigator.pushNamed<bool>(
          ScanQrPage.routeName,
        );
        if (result == true) {
          context.blocProvider<GuideCubit>().next();
        }
      },
    );
  }
}
