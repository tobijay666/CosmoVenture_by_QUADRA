import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/get_user_details.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetUserDetailsUseCase? getUserDetailsUseCase;
  SettingsBloc({this.getUserDetailsUseCase}) : super(SettingsInitial()) {
    on<SettingsLoading>(_onSettingsLoading);
    on<LogoutEvent>(_onLogout);
  }

  _onSettingsLoading(SettingsLoading event, Emitter<SettingsState> emit) async {
    final user = await getUserDetailsUseCase?.call(event.uid);
    return emit(SettingsLoaded(user: user!));
  }

  _onLogout(LogoutEvent, Emitter<SettingsState> emit) async {
    return emit(Logout());
  }
}
