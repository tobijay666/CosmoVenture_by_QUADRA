part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

class BookingLoading extends BookingEvent {}

class BookingEventRequested extends BookingEvent {
  final String id;
  final String destination;
  final String departure;
  final String arrival;
  final num passengerCount;

  final String date;
  final String time;
  final String price;

  const BookingEventRequested({
    required this.arrival,
    required this.id,
    required this.destination,
    required this.departure,
    required this.passengerCount,
    required this.date,
    required this.price,
    required this.time,
  });
}

class BookingAdded extends BookingEvent {}
