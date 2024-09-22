import 'package:dio/dio.dart';
import '../../../models/api_users_model.dart';

class ApiUsersService {
  final String baseUrl = 'http://localhost:5207/api/Users';
  final Dio _dio = Dio();

  Future<List<ApiUserModel>> fetchUser() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        List jsonResponse = response.data;
        return jsonResponse.map((user) => ApiUserModel.fromJson(user)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } on DioError catch (e) {
      throw Exception('Failed to load users: ${e.message}');
    }
  }


  Future<ApiUserModel> createUser(ApiUserModel user) async {
  try {
    final response = await _dio.post(
      baseUrl,
      data: user.toJson(),
    );
    if (response.statusCode == 201) {
      return ApiUserModel.fromJson(response.data);
    } else {
      throw Exception('Failed to create product');
    }
  } on DioError catch (e) {
    throw Exception('Failed to create product: ${e.message}');
  }
}


Future<ApiUserModel> fetchUserById(int id) async {
  try {
    final response = await _dio.get('$baseUrl/$id');
    if (response.statusCode == 200) {
      return ApiUserModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load user');
    }
  } on DioError catch (e) {
    throw Exception('Failed to load user: ${e.message}');
  }
}

Future<ApiUserModel> updateUser(int id, ApiUserModel user) async {
  try {
    final response = await _dio.put(
      '$baseUrl/$id',
      data: user.toJson(),
    );
    if (response.statusCode == 200) {
      return ApiUserModel.fromJson(response.data);
    } else {
      throw Exception('Failed to update user');
    }
  } on DioError catch (e) {
    throw Exception('Failed to update user: ${e.message}');
  }
}

Future<void> deleteUser(int id) async {
  try {
    final response = await _dio.delete('$baseUrl/$id');
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete user');
    }
  } on DioError catch (e) {
    throw Exception('Failed to delete user: ${e.message}');
  }
}

}
