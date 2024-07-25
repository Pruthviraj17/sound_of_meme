import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sound_of_memes/core/constants/server_constants.dart';
import 'package:sound_of_memes/core/failure/app_failure.dart';
import 'package:sound_of_memes/core/models/user_model.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepostory authRemoteRepostory(AuthRemoteRepostoryRef ref) {
  return AuthRemoteRepostory();
}

class AuthRemoteRepostory {
  Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
          '${ServerConstants.serverUrl}/auth/login',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      print(resBodyMap);
      if (response.statusCode != 200) {
        return Left(AppFailure(resBodyMap['detail']));
      }

      return Right(
        UserModel.fromMap(resBodyMap['user']).copyWith(
          token: resBodyMap['token'],
        ),
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> singUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse("${ServerConstants.serverUrl}/auth/signup"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {
            "name": name,
            "email": email,
            "password": password,
          },
        ),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      print(resBodyMap);
      if (response.statusCode != 201) {
        return Left(AppFailure(resBodyMap['detail']));
      }

      return Right(UserModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> getCurrentUserData(String token) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${ServerConstants.serverUrl}/auth/',
        ),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        return Left(AppFailure(resBodyMap['detail']));
      }

      return Right(
        UserModel.fromMap(resBodyMap).copyWith(
          token: token,
        ),
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
