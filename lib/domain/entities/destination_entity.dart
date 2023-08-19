import 'package:equatable/equatable.dart';

class DestinationEntity extends Equatable {
  final String? title;
  final String? description;
  final String? image;
  final String? price;
  final int? rating;

  const DestinationEntity({
    this.title,
    this.description,
    this.image,
    this.price,
    this.rating,
  });

  @override
  List<Object?> get props => [title, description, image, price, rating];
}
