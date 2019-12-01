import 'package:flutter/material.dart';

class Word {
  final String word;
  final int solution;
  final String hint;

  int get rightLetters => word.length - solution - 1;
  int get leftLetters => word.length - rightLetters - 1;

  const Word(this.word, this.solution, this.hint);
}