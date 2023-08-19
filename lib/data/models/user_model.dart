import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? name,
    final String? uid,
    final String? password,
    final String? iId,
    final String? address,
    final String? gender,
    final String? image,
  }) : super(
          name: name,
          iId: iId,
          uid: uid,
          password: password,
          address: address,
          gender: gender,
          image: image,
        );

  factory UserModel.formSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      name: documentSnapshot.get('name'),
      iId: documentSnapshot.get('iId'),
      address: documentSnapshot.get('address'),
      gender: documentSnapshot.get('gender'),
      image: documentSnapshot.get('image'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "iId": iId,
      "image": image,
      "address": address,
    };
  }
}
