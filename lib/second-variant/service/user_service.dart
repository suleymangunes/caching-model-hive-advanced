import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive_model_caching/second-variant/model/user_model_second.dart';

abstract class IHomeService {
  late final Dio _dio;

  IHomeService(Dio dio) {
    _dio = dio;
  }
  Future<List<UserModelSecond>?> fetchData();
}

class UserService extends IHomeService {
  final Dio dio;

  UserService(this.dio) : super(dio);

  @override
  Future<List<UserModelSecond>?> fetchData() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/todos');

    if (response.statusCode == HttpStatus.ok) {
      final userList = (response.data as List).map((e) => UserModelSecond.fromJson(e)).toList();
      return userList;
    }
    return null;
  }
}
