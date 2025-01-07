part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UploadProfilePic extends UserState {}

final class LoginLoading extends UserState {}

class LoginSuccess extends UserState {
  final String token;
  LoginSuccess({required this.token});
}

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
