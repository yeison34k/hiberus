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
        SizedBox(height: 10),
        Text( "Order ID : ${data["order"]["id"]}", style: GoogleFonts.aBeeZee()),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 20, right : 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Direction: ${data["bill"]["direction"]}", style: GoogleFonts.aBeeZee()),
              Text("Phone ${data["bill"]["phone"]}", style: GoogleFonts.aBeeZee()),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Pay method: ${data["bill"]["paymentMethod"]}", style: GoogleFonts.aBeeZee()),
              Row(
                children: <Widget>[
                  Text("Total: ", style: GoogleFonts.aBeeZee()),
                  Text(data["bill"]["total"].toString(), style: GoogleFonts.aBeeZee(
                    fontSize: 17,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold
                  )),
                ],
              )

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
