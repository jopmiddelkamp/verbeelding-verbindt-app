import 'package:equatable/equatable.dart';

class SizeEntity extends Equatable {
  const SizeEntity(
    this.width,
    this.height,
  );

  final double width;
  final double height;

  @override
  List<Object?> get props => [
        width,
        height,
      ];
}
