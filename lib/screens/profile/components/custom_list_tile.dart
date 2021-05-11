import 'package:flutter/material.dart';

import '../../../size_config.dart';

class CustomProfileListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CustomProfileListTile({this.title, this.subtitle, this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.all(getProportionateScreenWidth(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      ),
    );
  }
}
