part of 'booking_confirmation_bloc.dart';

abstract class BookingConfirmationEvent extends Equatable {
  const BookingConfirmationEvent();

  @override
  List<Object> get props => [];
}

class BookingConfirmationLoading extends BookingConfirmationEvent {}

class BookingConfirmationComplete extends BookingConfirmationEvent {}
