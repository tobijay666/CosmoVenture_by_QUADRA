import 'package:bloc/bloc.dart';
import 'package:cosmoventure/domain/entities/booking_entity.dart';
import 'package:cosmoventure/domain/usecases/get_booking_details.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/payment_entity.dart';
import '../../../domain/usecases/payment_usecase.dart';

part 'payment_state.dart';
part 'payment_event.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final GetBookingDetailsUseCase? getBookingDetailsUseCase;
  final PaymentUseCase? paymentUseCase;
  PaymentBloc({this.paymentUseCase, this.getBookingDetailsUseCase})
      : super(PaymentInitial()) {
    on<PaymentLoading>(_onPaymentLoading);
    on<PaymentMake>(_onPaymentMake);
    on<PaymentMade>(_onPaymentMade);
  }
  Future<void> _onPaymentLoading(
      PaymentLoading event, Emitter<PaymentState> emit) async {
    final booking = await getBookingDetailsUseCase?.call(event.bookingId);
    print(booking);

    return emit(PaymentLoaded(bookingEntity: booking));
  }

  Future<void> _onPaymentMade(
      PaymentMade event, Emitter<PaymentState> emit) async {
    return emit(PaymentConfirmation());
  }

  Future<void> _onPaymentMake(
      PaymentMake event, Emitter<PaymentState> emit) async {
    try {
      final paymentEntity = PaymentEntity(
          bookingId: event.bookingId,
          price: event.price,
          destination: event.destination,
          paymentType: event.paymentType);
      String paymentId = await paymentUseCase!.call(paymentEntity);
      return emit(PaymentSuccess(
        paymentId: paymentId,
        successTitle: "Payment Successful",
        successDesc: "Thank you for using our app",
      ));
    } catch (_) {
      return emit(PaymentError(
        errorTitle: "Something went wrong",
        errorDesc: "Please try again",
      ));
    }
  }
}
