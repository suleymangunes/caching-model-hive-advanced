import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_model_caching/second-variant/model/user_model_second.dart';

abstract class ICacheManager<T> {
  final String key;
  Box<UserModelSecond>? _box;

  ICacheManager(this.key);
  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  void registerAdapters();

  Future<void> clearAll() async {
    await _box?.clear();
  }

  Future<void> addItems(List<T> items);
  Future<void> putItems(List<T> items);

  T? getItem(String key);
  List<T>? getValues();

  Future<void> putItem(String key, T item);
  Future<void> removeItem(String key);
}

class UserCacheManager extends ICacheManager<UserModelSecond> {
  UserCacheManager(String key) : super(key);

  @override
  Future<void> addItems(List<UserModelSecond> items) async {
    await _box?.addAll(items);
  }

  @override
  Future<void> putItems(List<UserModelSecond> items) async {
    await _box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  UserModelSecond? getItem(String key) {
    return _box?.get(key);
  }

  @override
  Future<void> putItem(String key, UserModelSecond item) async {
    await _box?.put(key, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await _box?.delete(key);
  }

  @override
  List<UserModelSecond>? getValues() {
    return _box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserModelSecondAdapter());
    }
  }
}
