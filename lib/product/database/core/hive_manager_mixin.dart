import 'package:hive/hive.dart';

mixin HiveManagerMixin<T> {
  final String _key = T.toString();

  late Box<T> box;

  Future<void> start() async {
    box = await Hive.openBox<T>(_key);
  }

  Future<void> clear() => box.clear();
}
