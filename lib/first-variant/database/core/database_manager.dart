import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_model_caching/first-variant/views/home/model/user_model.dart';

abstract class IDatabaseManager {
  Future<void> start();
  Future<void> clear();
}

@immutable
final class DatabaseManager implements IDatabaseManager {
  @override
  Future<void> start() async {
    await _open();
    _initialOperation();
  }

  @override
  Future<void> clear() async {
    await Hive.deleteFromDisk();
  }

  Future<void> _open() async {
    await Hive.initFlutter();
  }

  void _initialOperation() {
    Hive.registerAdapter(UserModelAdapter());
  }
}
