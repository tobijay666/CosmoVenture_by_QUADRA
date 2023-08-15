part of 'user_chat_bloc.dart';

abstract class UserChatState extends Equatable {
  const UserChatState();

  @override
  List<Object> get props => [];
}

class UserChatInitial extends UserChatState {}
