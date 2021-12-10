import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class ProfileDataModel extends Equatable {
  const ProfileDataModel({
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

  ProfileDataModel copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    String? personalImage,
  }) {
    return ProfileDataModel(
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      personalImage: personalImage ?? this.personalImage,
    );
  }

  static ProfileDataModel fromJson(Map<String, dynamic> json) =>
      _$ProfileDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataModelToJson(this);
}
