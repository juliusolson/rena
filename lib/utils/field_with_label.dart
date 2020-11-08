import 'package:flutter/material.dart';

class FieldWithLabel extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String suffix;
  final bool numeric;

  FieldWithLabel(this.controller, {this.label, this.suffix, this.numeric});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(this.label, style: Theme.of(context).textTheme.caption),
      TextFormField(
          keyboardType:
              this.numeric ? TextInputType.number : TextInputType.text,
          controller: this.controller,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10.0, right:10.0, top: 1.0, bottom:1.0),
              suffixText: this.suffix.length > 0 ? this.suffix : null,
              labelStyle: Theme.of(context).textTheme.caption,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white, width: 1.0),
              )))
    ]);
  }
}
