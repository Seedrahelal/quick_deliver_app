import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:quick_deliver/helper/api_constants.dart';
import 'package:quick_deliver/models/user_profile_model.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  Future<void> login(String phoneNumber, String password) async {
    emit(LoginLoading());
    try {
      final response = await http.post(
        Uri.parse(EndPoint.loginUrl),
        body: {
          "phone": phoneNumber,
          "password": password,
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final String token = responseData['Token'];
        emit(LoginSuccess(token: token));
      } else {
        final error = jsonDecode(response.body);
        emit(LoginFailure(
          errorMessage: error['massage'] ?? 'Unknown error occurred',
        ));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'An error occurred: $e'));
    }
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String phone,
    required String password,
    required String confirmPassword,
    required String location,
    required File image,
  }) async {
    emit(RegisterLoading());
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(EndPoint.registerUrl),
      );
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
      });
      request.fields['first_name'] = firstName;
      request.fields['last_name'] = lastName;
      request.fields['phone'] = phone;
      request.fields['password'] = password;
      request.fields['password_confirmation'] = confirmPassword;
      request.fields['location'] = location;
      request.files.add(await http.MultipartFile.fromPath(
        'profile_picture',
        image.path,
      ));
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        emit(RegisterSuccess());
      } else {
        final error = jsonDecode(response.body);
        emit(RegisterFailure(
          errorMessage: error['massage'] ?? 'Unknown error occurred',
        ));
      }
    } catch (e) {
      emit(RegisterFailure(errorMessage: 'An error occurred: $e'));
    }
  }

  Future<void> logout(String token) async {
    emit(LogoutLoading());
    try {
      final response = await http.post(
        Uri.parse(EndPoint.logoutUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(LogoutSuccess());
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['massage'] ?? 'Unknown error';
        emit(LogoutFailure(errorMessage: errorMessage));
      }
    } catch (e) {
      emit(LogoutFailure(errorMessage: 'An error occurred: $e'));
    }
  }

  Future<void> getProfile(String token) async {
    emit(ProfileLoading());
    try {
      final response = await http.get(
        Uri.parse(EndPoint.profileUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final userProfile = UserProfile.fromJson(data);
        emit(ProfileSuccess(userProfile: userProfile));
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['massage'] ?? 'Failed to load profile';
        emit(ProfileFailure(errorMessage: errorMessage));
      }
    } catch (e) {
      emit(ProfileFailure(errorMessage: 'An error occurred: $e'));
    }
  }
}
