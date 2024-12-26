import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:quick_deliver/helper/api_constants.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> login(String phoneNumber, String password) async {
    emit(LoginLoading());
    try {
      final response = await http.post(Uri.parse(EndPoint.loginUrl),
          body: jsonEncode(
              {ApiKey.phone: phoneNumber, ApiKey.password: password}));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(LoginSuccess());
      } else {
        final error = jsonDecode(response.body);
        emit(LoginFailure(errorMessage: error[ApiKey.errorMessage]));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'An error occorred :$e'));
    }
  }

  Future<void> register(
      {required String firstName,
      required String lastName,
      required String phone,
      required String password,
      required String location,
      required File image}) async {
    emit(RegisterLoading());
    try {
      final request =
          http.MultipartRequest('POST', Uri.parse(EndPoint.registerUrl));
      request.fields[ApiKey.firstName] = firstName;
      request.fields[ApiKey.lastName] = lastName;
      request.fields[ApiKey.phone] = phone;
      request.fields[ApiKey.password] = password;
      request.fields[ApiKey.location] = location;
      request.files
          .add(await http.MultipartFile.fromPath(ApiKey.image, image.path));
      final response = await request.send();
      if (response.statusCode == 200) {
        emit(RegisterSuccess());
      } else {
        final error = await response.stream.bytesToString();
        emit(RegisterFailure(errorMessage: error));
      }
    } catch (e) {
      emit(RegisterFailure(errorMessage: 'An error occorred :$e'));
    }
  }





}
