class AlreadyOpenedException implements Exception {
  final String msg;
  final int itemId;

  AlreadyOpenedException(this.itemId) : msg = 'Bocsika, ma már kibontottad az ajándékodat :(';

  @override
  String toString() {
    return msg;
  }
}