class AlreadyOpenedException implements Exception {
  final String msg;

  AlreadyOpenedException() : msg = 'Bocsika, ma már kibontottad az ajándékodat :(';
}