import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phone;
  final String profilePicture;
  final String role;
  String publicId;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phone,
    required this.profilePicture,
    required this.role,
    this.publicId = '',
  });

  String get fullName => '$firstName $lastName';

  static List<String> nameParts(fullName) => fullName.split(" ");

  static UserModel get empty => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    userName: '',
    email: '',
    phone: '',
    profilePicture: '',
    role: '',
    publicId: '',
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': userName,
      'email': email,
      'phoneNumber': phone,
      'profilePicture': profilePicture,
      'role': role,
      'publicId': publicId,
    };
  }

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    if (data == null) return UserModel.empty;
    return UserModel(
      id: document.id,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      userName: data['username'] ?? '',
      email: data['email'] ?? '',
      phone: data['phoneNumber'] ?? '',
      profilePicture: data['profilePicture'] ?? '',
      role: data['role'] ?? '',
      publicId: data['publicId'] ?? '',
    );
  }
}
