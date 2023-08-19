import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashLoading>(_onSplashLoading);
  }

  _onSplashLoading(SplashLoading event, Emitter<SplashState> emit) async {
    emit(SplashLoaded());
  }
}
