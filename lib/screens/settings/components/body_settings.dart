import 'package:cookie/screens/settings/components/general_card.dart';
import 'package:cookie/screens/settings/components/heading_grey_card.dart';
import 'package:cookie/screens/settings/components/account_card.dart';
import 'package:cookie/screens/settings/components/other_card.dart';
import 'package:cookie/screens/settings/components/security_card.dart';
import 'package:flutter/material.dart';

class BodySettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreyCard(heading: 'Общее'),
          GeneralCard(),
          GreyCard(heading: 'Аккаунт'),
          AccountCard(),
          GreyCard(heading: 'Безопасность'),
          SecurityCard(),
          GreyCard(heading: 'Другое'),
          OthersCard(),
        ],
      ),
    );
  }
}
