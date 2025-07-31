import 'dart:convert';

import 'package:eky_pos/core/constants/variables.dart';
import 'package:eky_pos/presentation/auth/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<UserModel> getUser(String email) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/users');
      final response = await http.get(
        url.replace(queryParameters: {
          'email': email
        }),
      );

      await Future.delayed(const Duration(seconds: 1));

      if (response.statusCode == 200) {
        try {
          final List<dynamic> userData = json.decode(response.body);
          if (userData.isEmpty) {
            throw Exception('User not found');
          }
          final userJson = userData.first;
          return UserModel.fromMap(userJson);
        } catch (e) {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to connect to server');
      }
    } catch (e) {
      throw Exception('Network error occurred');
    }
  }

  Future<UserModel?> addUser(UserModel user) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/users');
      final response = await http.post(
        url,
        body: user.toMap(),
      );

      await Future.delayed(const Duration(seconds: 1));

      if (response.statusCode == 200) {
        try {
          final List<dynamic> userData = json.decode(response.body);
          if (userData.isEmpty) {
            throw Exception('User not found');
          }
          final userJson = userData.first;
          return UserModel.fromMap(userJson);
        } catch (e) {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to connect to server');
      }
    } catch (e) {
      throw Exception('Network error occurred');
    }
  }

  Future<bool> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
