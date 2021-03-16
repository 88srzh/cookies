import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback press;

  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        // padding: EdgeInsets.all(20),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon.icon),
            // SvgPicture.asset(
            //   icon,
            //   width: 22,
            //   color: kPrimaryColor,
            // ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
