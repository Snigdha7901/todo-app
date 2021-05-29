import 'package:flutter/material.dart';

class Listitem  extends StatelessWidget {
  @override
  final bool isChecked;
  final String name;
  final String desc;
  final Function changestate;
  final Function longPressCallback;
  final Function onTapCallback;
  Listitem({this.name, this.desc, this.isChecked, this.changestate, this.longPressCallback, this.onTapCallback});
  Widget build(BuildContext context) {

    return ListTile(
        onLongPress: longPressCallback,

      onTap: onTapCallback,

      title: Text(name,
      style: TextStyle(
        decoration: isChecked?TextDecoration.lineThrough:null
      ),),
      subtitle: Text(desc),
      trailing:  Checkbox(
        activeColor: Colors.red[900],
        value: isChecked, onChanged: changestate,

      )
    );
  }
}

