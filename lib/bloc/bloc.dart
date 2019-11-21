import 'package:rxdart/rxdart.dart';

import 'package:code/bloc/repository.dart';
import 'package:code/models/already_opened_exception.dart';
import 'package:code/models/item_model.dart';

class Bloc {
  final _repo = Repository();
  final _itemSubject = PublishSubject<ItemModel>();

  Observable<ItemModel> get itemParams => _itemSubject.stream;
  List<ItemModel> get allItems => _repo.allItems;

  Future<void> getAllItems() async {
    await _repo.getAllItems();
  }

  Future<void> openItem(int itemId) async {
    try {
      ItemModel itemData = await _repo.openItem(itemId);
    _itemSubject.sink.add(itemData);
    } on AlreadyOpenedException catch(e) {
      _itemSubject.sink.addError(e);
    }
  }

  Future<void> initDatabase() => _repo.initDatabase();

  void disposeOfBloc() {
    _itemSubject.close();
    print('disposed of bloc');
  }
}