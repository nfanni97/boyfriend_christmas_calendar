import 'package:code/models/item_model.dart';
import 'package:code/bloc/provider.dart';

class Repository {
  var _provider = Provider();
  List<ItemModel> allItems;

  Future<void> getAllItems() async => allItems = await _provider.getAllItems();
  Future<ItemModel> openItem(int itemId) => _provider.openItem(itemId);
  Future<void> initDatabase() => _provider.initDatabase();
}