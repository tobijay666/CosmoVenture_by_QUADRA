part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class AuthenticatingEvent extends LoginEvent {}

class LoginEventRequested extends LoginEvent {
  final String iId;
  final String password;

  const LoginEventRequested({required this.iId, required this.password});
}
