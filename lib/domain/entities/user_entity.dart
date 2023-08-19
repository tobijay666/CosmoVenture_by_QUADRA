import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? uid;
  final String? password;
  final String? iId;
  final String? address;
  final String? gender;
  final String? image;

  const UserEntity({
    this.name,
    this.uid,
    this.password,
    this.iId,
    this.address,
    this.gender,
    this.image,
  });

  @override
  List<Object?> get props => [name, uid, password, iId, address, gender, image];
}
