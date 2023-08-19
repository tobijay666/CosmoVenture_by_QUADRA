part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {}

class BookingError extends BookingState {
  final String errorTitle;
  final String? errorDesc;

  const BookingError({required this.errorTitle, this.errorDesc});
}

class BookingSuccess extends BookingState {
  final String? successTitle;
  final String? bookingId;
  final String? successDesc;

  const BookingSuccess({this.bookingId, this.successTitle, this.successDesc});
}

class BookingLoaded extends BookingState {}

class BookingPay extends BookingState {}
