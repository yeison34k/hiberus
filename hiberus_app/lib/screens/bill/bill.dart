import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiberusapp/constants.dart';

class BillPage extends StatelessWidget {
  final data;

  BillPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: body(),
    );
  }

  Widget body() {
    return Column(
      children: <Widget>[
        Center(
          child:
            Text(
              "Hi ${data["bill"]["clientName"]} thanks for your purchase",
              style: GoogleFonts.oswald(
                fontSize: 18,
                color: Colors.orange
              )
            ),
        ),
        Text( data["order"]["id"]),
        Padding(
          padding: EdgeInsets.only(left: 20, right : 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Direction: ${data["bill"]["direction"]} "),
              Text("Phone ${data["bill"]["phone"]}"),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Pay method: ${data["bill"]["paymentMethod"]}"),
              Text("Total: ${data["bill"]["total"]}"),
            ],
          ),
        )
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg", color: kTextColor,),
        onPressed: () {
          Navigator.pop(context);
        }),
      actions: <Widget>[
      ]
    );
  }
}
