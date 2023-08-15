part of 'user_comments_bloc.dart';

abstract class UserCommentsState extends Equatable {
  const UserCommentsState();

  @override
  List<Object> get props => [];
}

class UserCommentsInitial extends UserCommentsState {}
