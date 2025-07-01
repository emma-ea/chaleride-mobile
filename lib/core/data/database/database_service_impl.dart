import 'package:chaleride/core/data/database/database_service.dart';
import 'package:chaleride/core/data/database/op_boxes.dart';
import 'package:chaleride/core/utilities/logging_config.dart';
import 'package:hive/hive.dart';

class HiveDatabaseServiceImpl implements DatabaseService {
  @override
  Future<void> clearData() async {
    _clearBox(OpBoxes.users);
  }

  @override
  Future<void> create({required collection, required String key, value}) async {
    if (collection is OpBoxes) {
      final box = await _openBox(collection);
      final mappedValue = {'data': value};
      box.put(key, mappedValue);
    } else {
      throw ArgumentError("'collection' must of be of OpBoxes type");
    }
  }

  @override
  Future<void> delete({required collection, String? key}) async {
    if (collection is OpBoxes) {
      final box = await _openBox(collection);
      await box.delete(key);
    } else {
      throw ArgumentError("'collection' must of be of OpBoxes type");
    }
  }

  @override
  Future<Map<String, dynamic>> retrieve({required collection, String? key, required notFoundDefault}) async {
    if (!collection is OpBoxes) {
      throw ArgumentError("'collection' must be of OpBoxes type");
    }
    final box = await _openBox(collection);
    final boxContent = box.get(key);
    return boxContent?.cast<String, dynamic>() ?? {'data': notFoundDefault};
  }

  @override
  Future<void> update({required collection, required String key, value}) async {
    return create(collection: collection, key: key, value: value);
  }

  String _getBoxId(OpBoxes box) => box.name;

  Future<Box<T>> _openBox<T>(OpBoxes b) async {
    Box<T> box;
    final boxId = _getBoxId(b);

    if (Hive.isBoxOpen(boxId)) {
      box = Hive.box(boxId);
    } else {
      try {
        box = await Hive.openBox(boxId);
      } catch (e) {
        logger.e("\n\n${e.toString()}\n\n");
        await Hive.deleteBoxFromDisk(boxId);
        box = await Hive.openBox(boxId);
      }
    }
    return box;
  }

  Future<void> _clearBox<T>(OpBoxes box) async {
    try {
      final Box<T> _box = await _openBox<T>(box);
      _box.clear();
    } catch (_) {}
  }
}
