import 'package:equatable/equatable.dart';

class Asset extends Equatable {
  static const Asset introHeader = Asset._(
    'assets/images/intro-header.jpg',
  );
  static const Asset unknownArtist = Asset._(
    'assets/images/unknown-artist.jpg',
  );

  const Asset._(
    this.path,
  );

  final String path;

  @override
  List<Object?> get props => [path];
}
