// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_second.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelSecondAdapter extends TypeAdapter<UserModelSecond> {
  @override
  final int typeId = 0;

  @override
  UserModelSecond read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModelSecond(
      userId: fields[0] as int?,
      id: fields[1] as int?,
      title: fields[2] as String?,
      completed: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModelSecond obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelSecondAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelSecond _$UserModelSecondFromJson(Map<String, dynamic> json) =>
    UserModelSecond(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$UserModelSecondToJson(UserModelSecond instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
