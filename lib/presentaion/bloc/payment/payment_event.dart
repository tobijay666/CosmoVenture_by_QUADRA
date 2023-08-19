part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PaymentLoading extends PaymentEvent {
  final String bookingId;

  const PaymentLoading({required this.bookingId});
}

class PaymentMake extends PaymentEvent {
  final String bookingId;
  final String price;
  final String destination;
  final String paymentType;

  const PaymentMake(
      {required this.price,
      required this.destination,
      required this.paymentType,
      required this.bookingId});
}

class PaymentMade extends PaymentEvent {}
