import 'package:flutter/material.dart';

class GeneralCard extends StatelessWidget {
  const GeneralCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {},
        leading: Icon(Icons.language),
        title: Text('Язык'),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey[300],
        ),
        subtitle: Text('Русский'),
      ),
    );
  }
}
