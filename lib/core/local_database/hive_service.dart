import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/hive_model.dart';

class HiveService {
  final Box<Item> _box = Hive.box<Item>('items');

  // Expose stream to listen for changes
  Stream<List<Item>> get itemsStream => _box.watch().map((_) => _box.values.toList());

  Future<void> storeItems(List<Item> items, int page, bool clearAll) async {
    debugPrint('Storing items...');

    if (clearAll) {
      await _box.clear();
    }

    for (var item in items) {
      await _box.add(item);
    }

    debugPrint('Hive data count after storage: ${_box.values.length}');
  }

  List<Item> getItems() {
    return _box.values.toList();
  }
}
