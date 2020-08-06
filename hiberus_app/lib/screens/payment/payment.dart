import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiberusapp/constants.dart';
import 'package:hiberusapp/providers/http.dart';
import 'package:hiberusapp/styles/light_color.dart';
import 'package:hiberusapp/styles/theme.dart';
import 'package:hiberusapp/widget/title_text.dart';


class PaymentPage extends StatefulWidget {
  PaymentPage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

    HttpProvider httpProvider = HttpProvider.get();
    
    Widget _entryField(String title, {bool isPassword = false}) {
        return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                        height: 10,
                    ),
                    TextField(
                        obscureText: isPassword,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true))
                ],
            ),
        );
    }

    Widget _submitButton(BuildContext context) {
        return FlatButton(
            onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: LightColor.orange,
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12),
                width: AppTheme.fullWidth(context) * .7,
                child: TitleText(
                    text: 'Payment',
                    color: LightColor.background,
                    fontWeight: FontWeight.w500,
                ),
            ));
    }

    Widget _emailPasswordWidget() {
        return Column(
            children: <Widget>[
                _entryField("clientId"),
                _entryField("direction"),
                _entryField("phone"),
                _entryField("clientIdentity"),
                _entryField("clientName"),
                _entryField("paymentMethod"),
            ],
        );
    }

    @override
    Widget build(BuildContext context) {
        final height = MediaQuery.of(context).size.height;
        return Scaffold(
            appBar: _appBar(context),
            body: Container(
                height: height,
                child: Stack(
                    children: <Widget>[
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                        SizedBox(height: 10),
                                        _emailPasswordWidget(),
                                        SizedBox(height: 20),
                                        _submitButton(context),
                                    ],
                                ),
                            ),
                        ),
                    ],
                ),
            ));
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
                IconButton(
                    icon: SvgPicture.asset("assets/icons/search.svg", color: kTextColor),
                    onPressed: () {},
                ),
            ]
        );
    }
}