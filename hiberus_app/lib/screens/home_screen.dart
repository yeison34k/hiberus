import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiberusapp/components/body.dart';
import 'package:hiberusapp/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Body(),
    );
  }

  AppBar _appBar() {
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
                  icon: SvgPicture.asset("assets/icons/search.svg", color: kTextColor),
                  onPressed: () {},
              ),
              IconButton(
                  icon: SvgPicture.asset("assets/icons/cart.svg", color: kTextColor),
                  onPressed: () {},
              )
          ],
      );
  }
}
