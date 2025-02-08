import 'package:hive/hive.dart';
import '../models/hive_model.dart';

class HiveService {
  static final Box<Item> _box = Hive.box<Item>('items');

  static Future<void> storeItems(List<Item> items) async {
    await _box.clear(); // Clear existing data before storing new items
    for (var item in items) {
      await _box.put(item.id, item);
    }
  }

  static List<Item> getItems() {
    return _box.values.toList();
  }
}
