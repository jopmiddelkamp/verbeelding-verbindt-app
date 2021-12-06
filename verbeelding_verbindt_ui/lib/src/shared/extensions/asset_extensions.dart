import 'package:flutter/widgets.dart';

import '../../../verbeelding_verbindt_ui.dart';

extension AssetX on Asset {
  Image toImage({
    BoxFit? fit,
  }) {
    return Image.asset(
      path,
      package: Package.name,
      fit: fit,
    );
  }
}
