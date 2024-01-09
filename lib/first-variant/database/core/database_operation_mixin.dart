import 'package:hive_model_caching/first-variant/database/core/hive_manager_mixin.dart';
import 'package:hive_model_caching/first-variant/database/hive_model.dart';

class HiveDatabaseOperation<T extends HiveModelMixin> with HiveManagerMixin<T> {
  @override
  Future<void> clear() async {
    await box.clear();
  }

  Future<void> addOrUpdateItem(T model) => box.put(model.key, model);

  T? getItem(String key) => box.get(key);

  Future<void> deleteItem(String key) => box.delete(key);
}
