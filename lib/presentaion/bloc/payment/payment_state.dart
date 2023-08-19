part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentConfirmation extends PaymentState {}

class PaymentLoaded extends PaymentState {
  final BookingEntity? bookingEntity;

  const PaymentLoaded({this.bookingEntity});
}

class PaymentSuccess extends PaymentState {
  final String successTitle;
  final String? successDesc;
  final String? paymentId;
  const PaymentSuccess(
      {required this.successTitle, this.successDesc, this.paymentId});
}

class PaymentError extends PaymentState {
  final String errorTitle;
  final String? errorDesc;

  const PaymentError({required this.errorTitle, this.errorDesc});
}
