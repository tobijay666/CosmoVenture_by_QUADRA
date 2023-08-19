part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final String successTitle;
  final String? successDesc;
  const LoginSuccess({required this.successTitle, this.successDesc});
}

class LoginError extends LoginState {
  final String errorTitle;
  final String? errorDesc;

  const LoginError({required this.errorTitle, this.errorDesc});
}
