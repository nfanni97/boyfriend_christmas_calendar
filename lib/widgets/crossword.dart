import 'package:flutter/material.dart';

import 'package:code/models/word.dart';

class CrossWord extends StatefulWidget {
  final Word word;
  final int maxRightLength;
  final int maxLeftLength;

  CrossWord(this.word, this.maxLeftLength, this.maxRightLength);
  @override
  _CrossWordState createState() => _CrossWordState();
}

class _CrossWordState extends State<CrossWord> {
  int get _length => widget.word.word.length;
  final _formKey = GlobalKey<FormState>();
  var _controllers = List<TextEditingController>();
  var _nodes = List<FocusNode>();
  var _fields = List<TextFormField>();
  double _width;
  double get _height => _width * 2;

  OutlineInputBorder _getBorder(int index, [bool isCorrect = true]) {
    Color color;
    double width;
    if (index == widget.word.solution) {
      width = 3.0;
    } else {
      width = 1.0;
    }
    if (isCorrect) {
      color = Colors.green;
    } else {
      color = Colors.red.shade800;
    }
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: width));
  }

  @override
  initState() {
    super.initState();
    for (int i = 0; i < _length; i++) {
      _controllers.add(TextEditingController());
      _nodes.add(FocusNode());
      _fields.add(TextFormField(
        controller: _controllers[i],
        validator: _validator,
        autovalidate: true,
        maxLength: 1,
        onChanged: i < _length - 1 ? _onEdit : null,
        focusNode: _nodes[i],
        textAlign: TextAlign.center,
        style: i==widget.word.solution ? TextStyle(fontWeight: FontWeight.bold,) : null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          counter: Offstage(),
          enabledBorder: _getBorder(i),
          errorBorder: _getBorder(i, false),
          disabledBorder: _getBorder(i),
          focusedBorder: _getBorder(i),
          focusedErrorBorder: _getBorder(i, false),
        ),
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].dispose();
      _nodes[i].dispose();
    }
  }

  void _onEdit(String value) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  String _validator(String value) {
    String current = '';
    for (var i = 0; i < _length; i++) {
      current += _controllers[i].value.text;
    }
    if (current.toLowerCase() != widget.word.word) {
      return '';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    _width = (MediaQuery.of(context).size.width * 0.82 - 20) /
        (widget.maxLeftLength + widget.maxRightLength + 1);
    return Form(
      key: _formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ...List.generate(widget.maxLeftLength - widget.word.leftLetters,
              (_) => SizedBox(width: _width, height: _height)),
          ...List.generate(
            _fields.length,
            (index) => SizedBox(
              width: _width,
              //height: _height,
              child: _fields[index],
            ),
          ),
          ...List.generate(widget.maxRightLength - widget.word.rightLetters,
              (_) => SizedBox(width: _width, height: _width)),
          SizedBox(width: 10),
          SizedBox(
            width: 20,
            height: _height,
            child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.topCenter,
              icon: Icon(Icons.help_outline),
              onPressed: _showDialog,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Egy kis segítség'),
        content: Text(widget.word.hint,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.body1),
      ),
    );
  }
}
