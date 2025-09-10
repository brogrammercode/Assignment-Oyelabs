import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:oyelabs/utils/location.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String avatar;
  final String bio;
  final UserLocationModel address;
  final Timestamp creationTD;
  final bool deactivate;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.bio,
    required this.address,
    required this.creationTD,
    required this.deactivate,
  });

  // copyWith method
  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? bio,
    UserLocationModel? address,
    Timestamp? creationTD,
    bool? deactivate,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      bio: bio ?? this.bio,
      address: address ?? this.address,
      creationTD: creationTD ?? this.creationTD,
      deactivate: deactivate ?? this.deactivate,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'avatar': avatar,
      'bio': bio,
      'address': address.toJson(),
      'creationTD': creationTD,
      'deactivate': deactivate,
    };
  }

  // fromJson method
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? "",
      email: json['email'] ?? "",
      name: json['name'] ?? "",
      avatar: json['avatar'] ?? "",
      bio: json['bio'] ?? "",
      address: UserLocationModel.fromJson(json['address'] ?? {}),
      creationTD: json['creationTD'] ?? Timestamp.now(),
      deactivate: json['deactivate'] ?? false,
    );
  }

  // toString method
  @override
  String toString() {
    return '''
UserModel(
  id: $id,
  email: $email,
  name: $name,
  avatar: $avatar,
  bio: $bio,
  address: $address,
  creationTD: $creationTD,
  deactivate: $deactivate,
)
    ''';
  }

  @override
  List<Object?> get props => [
    id,
    email,
    name,
    avatar,
    bio,
    address,
    creationTD,
    deactivate,
  ];
}
