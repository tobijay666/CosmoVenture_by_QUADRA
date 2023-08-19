import 'dart:ffi';

import 'package:equatable/equatable.dart';

class DestinationEntity extends Equatable {
  final String? title;
  final String? description;
  final List<String>? image;
  final String? price;
  final String? coordinates;
  final num? rating;
  final num? age;
  final num? density;
  final num? gravity;
  final num? magnitude;
  final num? oxygen;
  final num? distance;
  final num? hTemp;
  final num? cTemp;
  final num? lTemp;

  const DestinationEntity({
    this.coordinates,
    this.age,
    this.density,
    this.gravity,
    this.magnitude,
    this.oxygen,
    this.distance,
    this.hTemp,
    this.cTemp,
    this.lTemp,
    this.title,
    this.description,
    this.image,
    this.price,
    this.rating,
  });

  @override
  List<Object?> get props => [title, description, image, price, rating];
}
