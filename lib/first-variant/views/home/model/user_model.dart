import 'package:hive/hive.dart';
import 'package:hive_model_caching/first-variant/database/hive_model.dart';
import 'package:hive_model_caching/first-variant/database/core/hive_types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypes.userModelId)
final class UserModel with HiveModelMixin {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? surname;

  UserModel({this.name, this.surname});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String get key {
    if (name != null) {
      return name.toString();
    } else {
      throw Exception("name is null");
    }
  }
}
