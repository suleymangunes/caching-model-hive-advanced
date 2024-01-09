import 'package:hive_model_caching/product/database/core/database_operation_mixin.dart';
import 'package:hive_model_caching/views/home/model/user_model.dart';

class UserHiveModel extends HiveDatabaseOperation<UserModel> {
  final UserModel user;

  UserHiveModel({required this.user});
}
