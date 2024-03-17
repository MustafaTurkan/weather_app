import 'package:hive/hive.dart';

abstract class BaseLocalManager<T> {
  BaseLocalManager(
    this.boxKey, {
    this.typeId,
    this.adapter,
  });
  final String boxKey;
  final int? typeId;
  final TypeAdapter<T>? adapter;
  Box<T>? _box;

  void registerAdapters() {
    if (adapter == null || typeId == null) {
      return;
    }
    if (!Hive.isAdapterRegistered(typeId!)) {
      Hive.registerAdapter<T>(adapter!);
    }
  }

  Future<void> initBox({bool isEncryption = false}) async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<T>(_key());
    }
  }

  Future<void> close() async {
    if ((_box?.isOpen ?? false)) {
      await Hive.close();
    }
  }

  List<T>? getAll() {
    return _box?.values.toList();
  }

  Future<void> delete(dynamic key) async {
    await _box?.delete(key);
  }

  Future<void> putAll(Map<dynamic, T> entries) async {
    await _box?.putAll(entries);
  }

  Future<void> clear() async {
    await _box?.clear();
  }

  Future<void> add(dynamic key, T? item) async {
    await _box?.put(
      key,
      item as T,
    );
  }

  T? get(dynamic key) {
    return _box?.get(key);
  }

  String _key() {
    return boxKey;
  }
}
