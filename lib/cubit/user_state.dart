part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class LoginLoading extends UserState {}

final class LoginSuccess extends UserState {}

final class LoginFailure extends UserState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}

final class RegisterLoading extends UserState {}

final class RegisterSuccess extends UserState {}

final class RegisterFailure extends UserState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}
