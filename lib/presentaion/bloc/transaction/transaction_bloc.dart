import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';
part 'transaction_event.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionLoading>(_onTransactionLoading);
  }
  Future<void> _onTransactionLoading(
      TransactionLoading event, Emitter<TransactionState> emit) async {
    return emit(TransactionLoaded());
  }
}
