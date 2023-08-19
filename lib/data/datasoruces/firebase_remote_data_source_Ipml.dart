import 'dart:convert';
import 'dart:io';
import 'package:cosmoventure/data/models/user_model.dart';
import 'package:cosmoventure/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:http/http.dart' as http;
import 'package:dbcrypt/dbcrypt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'firebase_remote_data_source_impl.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final FirebaseStorage firebaseStorage;

  FirebaseRemoteDataSourceImpl(
      {required this.auth,
      required this.firestore,
      required this.firebaseStorage});

  @override
  Future<void> signUp(UserEntity user) async {
    try {
      final userDocRef = firestore.collection('users').doc(user.iId);
      final userDocSnapshot = await userDocRef.get();

      if (!userDocSnapshot.exists) {
        final hashedPassword = await FlutterBcrypt.hashPw(
            password: user.password!, salt: r'$2b$06$C6UzMDM.H6dfI/f/IKxGhu');

        await userDocRef.set(
          {
            "name": user.name,
            "iId": user.iId,
            "address": user.address,
            "password": hashedPassword,
          },
        );
      } else {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  @override
  Future<void> signIn(UserEntity user) async {
    try {
      final userDocRef = firestore.collection('users').doc(user.iId);
      final userDocSnapshot = await userDocRef.get();

      if (userDocSnapshot.exists) {
        final storedHashedPassword = userDocSnapshot.data()?['password'];
        final isPasswordMatch = await FlutterBcrypt.verify(
          password: user.password!,
          hash: storedHashedPassword,
        );

        print(isPasswordMatch);

        if (isPasswordMatch) {
          // Password matches, user is authenticated.
          print('User authenticated successfully.');
        } else {
          throw Exception('Incorrect password.');
        }
      } else {
        throw Exception('User not found.');
      }
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }
}
