import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model_second.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class UserModelSecond with EquatableMixin {
  @HiveField(0)
  int? userId;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? title;
  @HiveField(3)
  bool? completed;

  UserModelSecond({this.userId, this.id, this.title, this.completed});

  factory UserModelSecond.fromJson(Map<String, dynamic> json) => _$UserModelSecondFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelSecondToJson(this);

  @override
  List<Object?> get props => [userId];
}
