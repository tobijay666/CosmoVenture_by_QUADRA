import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cosmoventure/utils/app_strings.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/signIn_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInUseCase? signInUseCase;
  LoginBloc({this.signInUseCase}) : super(LoginInitial()) {
    on<AuthenticatingEvent>(_appStarted);
    on<LoginEventRequested>(_onLoginEventRequested);
    ;
  }

  ///function to check wether the user is already logged in or not
  Future<void> _appStarted(
      AuthenticatingEvent event, Emitter<LoginState> emit) async {
    return emit(LoginInitial());
  }

  Future<void> _onLoginEventRequested(
      LoginEventRequested event, Emitter<LoginState> emit) async {
    if (event.iId.isEmpty || event.password.isEmpty) {
      return emit(LoginError(
        errorTitle: AppStrings.emptyFieldsErrorTitle,
        errorDesc: AppStrings.emptyFields,
      ));
    } else {
      try {
        final user = UserEntity(
            iId: event.iId.trim().toString(),
            password: event.password.trim().toString());
        await signInUseCase?.call(user);
        emit(LoginSuccess(
          successTitle: "Logged In",
          successDesc: "Your have been successfully logged in to your account",
        ));
      } on SocketException catch (_) {
        emit(
          const LoginError(
            errorTitle: "ErrorHandler.invalidEmailPassword",
            errorDesc: "ErrorHandler.invalidEmailPasswordDesc",
          ),
        );
      } catch (e) {
        emit(
          const LoginError(
            errorTitle: "ErrorHandler.invalidEmailPassword",
            errorDesc: "ErrorHandler.invalidEmailPasswordDesc",
          ),
        );
      }
    }
  }
}
