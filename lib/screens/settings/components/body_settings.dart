import 'package:flutter/material.dart';

class BodySettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: double.infinity,
                color: Color.fromRGBO(243, 239, 249, 1.0),
                child: Text(
                  'Общие',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(children: [
            Text('123'),
          ]),
        ],
      ),
    );
  }
}
