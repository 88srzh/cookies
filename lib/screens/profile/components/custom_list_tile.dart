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
      onTap: onTap,
      leading: icon,
      title: Text(title, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.black87, fontSize: 16)),
    );
  }
}
