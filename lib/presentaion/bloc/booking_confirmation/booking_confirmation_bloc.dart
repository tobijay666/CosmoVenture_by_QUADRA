import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'booking_confirmation_event.dart';
part 'booking_confirmation_state.dart';

class BookingConfirmationBloc
    extends Bloc<BookingConfirmationEvent, BookingConfirmationState> {
  BookingConfirmationBloc() : super(BookingConfirmationInitial()) {
    on<BookingConfirmationEvent>((event, emit) {});
  }
}
