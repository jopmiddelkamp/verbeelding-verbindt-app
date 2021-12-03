import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  UserEntity({
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
