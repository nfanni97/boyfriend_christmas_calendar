class ItemModel {
  int itemId;
  bool isOpened;
  int openedOn;
  int surpriseId;

  ItemModel.fromMap(Map<String,dynamic> map) {
    itemId = map['item_id'];
    isOpened = map['is_opened'] == 1;
    openedOn = map['opened_on'];
    surpriseId = map['surprise_id'];
  }

  Map<String,dynamic> toMap() {
    return {
      'item_id': itemId,
      'is_opened': isOpened ? 1 : 0,
      'opened_on': openedOn,
      'surprise_id': surpriseId,
    };
  }

  @override
  String toString() {
    return 'itemId: $itemId\t${isOpened ? 'opened' : 'not opened'}\topened on: $openedOn\tsurpriseId: $surpriseId';
  }
}