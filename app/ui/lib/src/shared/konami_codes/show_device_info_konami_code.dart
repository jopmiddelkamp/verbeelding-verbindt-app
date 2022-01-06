import 'package:konami_detector/konami_detector.dart';

import '../../../verbeelding_verbindt_ui.dart';

class ShowDeviceInfoKonamiCode extends KonamiCode {
  ShowDeviceInfoKonamiCode()
      : super(
          codes: const [
            KonamiCodeInput.up,
            KonamiCodeInput.up,
            KonamiCodeInput.down,
            KonamiCodeInput.down,
            KonamiCodeInput.left,
            KonamiCodeInput.left,
            KonamiCodeInput.right,
            KonamiCodeInput.right,
          ],
          onMatch: showDeviceInfoDialog,
        );
}
