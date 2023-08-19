import 'dart:ffi';

import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  final String? bookingId;
  final String? destination;
  final String? paymentType;
  final String? price;

  const PaymentEntity(
      {this.bookingId, this.destination, this.paymentType, this.price});

  @override
  List<Object?> get props => [bookingId, destination, paymentType, price];
}
