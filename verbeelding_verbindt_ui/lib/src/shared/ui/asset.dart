import 'package:smart_enums/smart_enums.dart';

class Asset extends SmartEnumWithValue<Asset, String> {
  static const Asset introHeader = Asset._(
    'assets/images/intro-header.jpg',
  );
  static const Asset unknownArtist = Asset._(
    'assets/images/unknown-artist.jpg',
  );

  const Asset._(
    String value,
  ) : super(value);

  String get path => value;
}
