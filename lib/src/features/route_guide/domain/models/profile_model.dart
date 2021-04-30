import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class ProfileModel extends Equatable {
  const ProfileModel({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.personalImage,
  });

  final String firstName;
  final String? middleName;
  final String lastName;
  final String? personalImage;

  String get fullName {
    final middle = middleName?.isNotEmpty == true ? '$middleName ' : '';
    return '$firstName $middle$lastName';
  }

  bool get hasPersonalImage => personalImage?.isNotEmpty == true;

  @override
  List<Object?> get props => [firstName, middleName, lastName, personalImage];

  @override
  String toString() => '''$runtimeType { 
                            firstName: $firstName, 
                            middleName: $middleName, 
                            lastName: $lastName, 
                            personalImage: $personalImage 
                          }''';

  ProfileModel copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    String? personalImage,
  }) {
    return ProfileModel(
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      personalImage: personalImage ?? this.personalImage,
    );
  }

  static ProfileModel fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
