import 'package:flutter/material.dart';
import 'colors.dart';

class RenaFlatButton extends StatelessWidget {
  final String text;
  final double minWidth;
  final Function onPressed;
  
  RenaFlatButton(this.text, this.minWidth, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: 200,
      color: createMaterialColor(Color(0xff00d3b3)),
      textColor: Colors.white,
      disabledColor: Colors.grey,
      padding: EdgeInsets.all(8.0),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      onPressed: () => onPressed,
      child: Text(
        this.text,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
