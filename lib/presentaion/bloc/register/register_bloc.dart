import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cosmoventure/utils/app_strings.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/signUp_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SignUpUseCase? signUpUseCase;

  RegisterBloc({this.signUpUseCase}) : super(RegisterInitial()) {
    on<RegisterEventRequested>(_onRegisterEventRequested);
    on<RegisterLoading>(_onRegisterLoading);
  }

  Future<void> _onRegisterLoading(
      RegisterLoading event, Emitter<RegisterState> emit) async {
    return emit(RegisterInitial());
  }

  Future<void> _onRegisterEventRequested(
      RegisterEventRequested event, Emitter<RegisterState> emit) async {
    if (event.iId.isEmpty ||
        event.name.isEmpty ||
        event.password.isEmpty ||
        event.cPassword.isEmpty) {
      return emit(
        const RegisterError(
          errorTitle: AppStrings.emptyFieldsErrorTitle,
          errorDesc: AppStrings.emptyFields,
        ),
      );
    } else if (event.password.trim().toString().length < 8) {
      return emit(
        const RegisterError(
          errorTitle: "Check Your Password",
          errorDesc: "Password Must have at least 8 characters ",
        ),
      );
    } else if (event.password.trim().toString() !=
        event.cPassword.trim().toString()) {
      return emit(
        const RegisterError(
          errorTitle: "Password Mismatch",
          errorDesc: "Check Your Password and confirm",
        ),
      );
    } else {
      try {
        final user = UserEntity(
            iId: event.iId.trim().toString(),
            name: event.name.trim().toString(),
            password: event.password.trim().toString());
        await signUpUseCase?.call(user);

        emit(const RegisterSuccess(
          successTitle: "Successfully Registered",
          successDesc: "Your Account has been successfully created",
        ));
      } on SocketException catch (_) {
        emit(
          const RegisterError(
            errorTitle: "Invalid Id",
            errorDesc: "Id is already taken",
          ),
        );
      } catch (_) {
        emit(
          const RegisterError(
            errorTitle: "Invalid Id",
            errorDesc: "Id is already taken",
          ),
        );
      }
    }
  }
}
