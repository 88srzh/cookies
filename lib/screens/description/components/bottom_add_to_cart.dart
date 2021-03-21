import 'package:cookie/models/cart.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sweetId = ModalRoute.of(context).settings.arguments as String;
    final loadedSweet = Provider.of<Sweets>(context).findById(sweetId);
    final cart = Provider.of<Cart>(context);
    final messenger = ScaffoldMessenger.of(context);
    return Container(
      alignment: Alignment.topCenter,
      height: getProportionateScreenWidth(100),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Color.fromRGBO(250, 237, 238, 1.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: getProportionateScreenWidth(30),
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10),
          bottom: getProportionateScreenWidth(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${loadedSweet.price}₽',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(15),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(40),
              ),
              child: InkWell(
                child: Text(
                  'Добавить в корзину',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  cart.addItem(
                    sweetId,
                    loadedSweet.title,
                    loadedSweet.price,
                    loadedSweet.images,
                  );
                  messenger.showSnackBar(SnackBar(
                    content: Text('Товар добавлен в корзину'),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
