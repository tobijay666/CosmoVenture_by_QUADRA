part of 'booking_confirmation_bloc.dart';

abstract class BookingConfirmationState extends Equatable {
  const BookingConfirmationState();

  @override
  List<Object> get props => [];
}

class BookingConfirmationInitial extends BookingConfirmationState {}

class BookingConfirmationLoaded extends BookingConfirmationState {}

class BookingConfirmationSuccess extends BookingConfirmationState {}
