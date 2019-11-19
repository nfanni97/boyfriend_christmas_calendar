import 'package:code/models/item_model.dart';
import 'package:code/bloc/provider.dart';

class Repository {
  var _provider = Provider();
  List<ItemModel> allItems;

  Future<void> getAllItems() async => allItems = await _provider.getAllItems();
  Future<ItemModel> openItem(int itemId) async {
    final opened = await _provider.openItem(itemId);
    //update allItems
    allItems[itemId] = opened;
    return opened;
  }

  Future<void> initDatabase() => _provider.initDatabase();
}
