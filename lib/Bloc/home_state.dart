part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


class UserLoading extends HomeState{}

class UserGet extends HomeState{
  List users;
  UserGet(this.users);
}