import 'package:code/bloc/repository.dart';

class Bloc {
  final _repo = Repository();

  void disposeOfBloc() {
    print('disposed');
  }
}