import 'package:flutter/material.dart';

class GeneralCard extends StatelessWidget {
  const GeneralCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
      ),
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
