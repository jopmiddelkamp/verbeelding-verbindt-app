import 'package:equatable/equatable.dart';

class UserGeoLocation extends Equatable {
  const UserGeoLocation({
    required this.id,
    required this.isAnonymous,
  });

  final String id;
  final bool isAnonymous;

  @override
  List<Object?> get props => [
        id,
        isAnonymous,
      ];
}
