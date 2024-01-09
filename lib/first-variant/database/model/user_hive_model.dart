import 'package:hive_model_caching/first-variant/database/core/database_operation_mixin.dart';
import 'package:hive_model_caching/first-variant/views/home/model/user_model.dart';

class UserHiveModel extends HiveDatabaseOperation<UserModel> {
  final UserModel user;

  UserHiveModel({required this.user});
}
