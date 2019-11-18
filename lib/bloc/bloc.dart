import 'package:rxdart/rxdart.dart';

import 'package:code/item_model.dart';
import 'package:code/bloc/repository.dart';

class Bloc {
  final _repo = Repository();
  final _itemSubject = PublishSubject<ItemModel>();

  Observable<ItemModel> get itemParams => _itemSubject.stream;
  List<ItemModel> get allItems => _repo.allItems;

  Future<void> getAllItems() async {
    await _repo.getAllItems();
  }

  Future<void> openItem(int itemId) async {
    ItemModel itemData = await _repo.openItem(itemId);
    _itemSubject.sink.add(itemData);
  }

  Future<void> initDatabase() => _repo.initDatabase();

  void disposeOfBloc() {
    _itemSubject.close();
    print('disposed of bloc');
  }
}