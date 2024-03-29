import 'package:flutter/material.dart';

class CustomProfileListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final Function onTap;

  const CustomProfileListTile({this.title, this.subtitle, this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: EdgeInsets.all(0),
      onTap: onTap,
      trailing: Icon(Icons.keyboard_arrow_right),
      title: Text(title, style: TextStyle(color: Colors.black, fontSize: 14)),
      // subtitle: Text(subtitle, style: TextStyle(color: Colors.black87, fontSize: 14)),
    );
  }
}
