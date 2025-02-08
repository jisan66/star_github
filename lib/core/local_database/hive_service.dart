import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/hive_model.dart';

class HiveService {
  final Box<Item> _box = Hive.box<Item>('items');
  Box<Item> get box => _box;

  Future<void> storeItems(List<Item> items) async {
    debugPrint('is store items called??????');

    await box.clear();
    debugPrint("is store Items called-----------------------------");// Clear existing data before storing new items
    for (var item in items) {
      debugPrint("is store Items called-----------------------------");
      await box.add(item);
    }
    debugPrint('box value length-------------------------------------------------after storage${box.values.toList().length}');
  }

  List<Item> getItems() {
    return box.values.toList();
  }
}
