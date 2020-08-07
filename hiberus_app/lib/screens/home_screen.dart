import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiberusapp/components/body.dart';
import 'package:hiberusapp/constants.dart';
import 'package:hiberusapp/screens/cart/cart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        body: Body(),
    );
  }

  AppBar _appBar(BuildContext context) {
      return AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              color: kTextColor,
              icon: SvgPicture.asset("assets/icons/back.svg"),
              onPressed: () {
              }),
          actions: <Widget>[
              IconButton(
                  icon: SvgPicture.asset("assets/icons/cart.svg", color: kTextColor),
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                  },
              )
          ],
      );
  }
}
