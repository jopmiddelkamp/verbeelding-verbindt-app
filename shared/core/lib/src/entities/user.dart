import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
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
