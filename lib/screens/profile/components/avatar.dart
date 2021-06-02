import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatarUrl;
  final Function onTap;

  const Avatar({this.avatarUrl, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: avatarUrl == null
            ? CircleAvatar(
              backgroundColor: Colors.pinkAccent,
                radius: getProportionateScreenWidth(50),
                child: Icon(Icons.photo_camera),
              )
            : CircleAvatar(
                radius: getProportionateScreenWidth(50),
                backgroundImage: NetworkImage(avatarUrl),
              ),
      ),
    );
  }
}
