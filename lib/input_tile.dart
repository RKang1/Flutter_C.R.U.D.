import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input.dart';

const _rowHeight = 60.0;
const _fontSize = 20.0;

class InputTile extends StatelessWidget {
  final Input input;

  const InputTile({
    Key key,
    @required this.input,
  })  : assert(input != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: _rowHeight,
        child: InkWell(
          onTap: () {
            //TODO Add edit function
            print('TODO Create edit function');
          },
          onLongPress: () {
            //TODO Add delete function
            print('TODO Create delete function');
          },
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  input.text,
                  style: new TextStyle(fontSize: _fontSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
