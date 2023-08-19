import 'dart:ffi';

import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final String? id;
  final String? destination;
  final String? departure;
  final String? arrival;
  final String? price;
  final num? passengerCount;

  final String? date;
  final String? time;

  const BookingEntity({
    this.price,
    this.id,
    this.destination,
    this.departure,
    this.arrival,
    this.passengerCount,
    this.date,
    this.time,
  });

  @override
  List<Object?> get props =>
      [id, destination, departure, arrival, passengerCount, date, time, price];
}
