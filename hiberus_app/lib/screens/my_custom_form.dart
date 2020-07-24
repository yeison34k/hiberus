import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyCustomForm extends StatefulWidget {
    @override
    MyCustomFormState createState() {
        return MyCustomFormState();
    }
}

class MyCustomFormState extends State<MyCustomForm> {
    final _formKey = GlobalKey<FormState>();
    var _currentSelectedValue = "Cash payment";
    var textStyle = "";
    List productsPay = [];

    final _currencies = [
        "Cash payment",
        "Credit card",
    ];

    List _products = [
        {
            "id": 1,
            "name": "Calditos",
            "cost": 10.340
        },
        {
            "id": 2,
            "name": "su carita",
            "cost": 20.200
        },
        {
            "id": 3,
            "name": "mr choco ramo",
            "cost": 40.500
        }
    ];

    Map<String, dynamic> _product = {
        "id": 3,
        "name": "mr choco ramo",
        "cost": 40.500
    };

    Map<String, dynamic> example = {
        "order": {
            "clientId": "1",
            "direction": "calle 43 # 11- 23",
            "products": [
                {
                    "id": 1,
                    "quantity": 11,
                    "cost": 30.200
                },
                {
                    "id": 2,
                    "quantity": 2,
                    "cost": 10.300
                }
            ]
        },
        "bill" : {
            "phone": "3174568954",
            "clientIdentity": "123938463",
            "clientName": "yeison aristizabal",
            "paymentMethod": "Efectivo"
        }
    };

    guardar() async {
        var headers = {
            'Content-Type': 'application/json'
        };
        var url = 'http://192.168.1.15:8989/api/payment';
        var response = await post(url, body:  json.encode(example), headers: headers);
        var data = jsonDecode(response.body);
        print(data);
    }

    Form form() {
        return  Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
                children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey[400],
                                                    blurRadius: 2.0,
                                                    offset: Offset(0, 1)
                                                )
                                            ]
                                        ),
                                        child: Container(
                                            padding: EdgeInsets.only(left: 1.0, right: 1.0),
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                            ),
                                            child: TextFormField(
                                                decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                    icon: Icon(Icons.vpn_key),
                                                    hintText: 'Enter your client ID',
                                                    labelText: 'Client ID',
                                                    hintStyle: TextStyle(color: Colors.grey)
                                                ),
                                            ),
                                        )
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey[400],
                                                    blurRadius: 5.0,
                                                    offset: Offset(0, 1)
                                                )
                                            ]
                                        ),
                                        child: Container(
                                            padding: EdgeInsets.only(left: 1.0, right: 1.0),
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                            ),
                                            child: TextFormField(
                                                decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                    icon: const Icon(Icons.person),
                                                    hintText: 'Enter your name',
                                                    labelText: 'Name',
                                                    hintStyle: TextStyle(color: Colors.grey)
                                                ),
                                            ),
                                        )
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey[400],
                                                    blurRadius: 5.0,
                                                    offset: Offset(0, 1)
                                                )
                                            ]
                                        ),
                                        child: Container(
                                            padding: EdgeInsets.only(left: 1.0, right: 1.0),
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                            ),
                                            child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                    icon: const Icon(Icons.verified_user),
                                                    hintText: 'Enter your ID',
                                                    labelText: 'Identity',
                                                    hintStyle: TextStyle(color: Colors.grey)
                                                ),
                                            ),
                                        )
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey[400],
                                                    blurRadius: 5.0,
                                                    offset: Offset(0, 1)
                                                )
                                            ]
                                        ),
                                        child: Container(
                                            padding: EdgeInsets.only(left: 1.0, right: 1.0),
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                            ),
                                            child: TextFormField(
                                                decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                    icon: const Icon(Icons.directions),
                                                    hintText: 'Enter your home direction',
                                                    labelText: 'Direction',
                                                    hintStyle: TextStyle(color: Colors.grey)
                                                ),
                                            ),
                                        )
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey[400],
                                                    blurRadius: 5.0,
                                                    offset: Offset(0, 1)
                                                )
                                            ]
                                        ),
                                        child: Container(
                                            padding: EdgeInsets.only(left: 1.0, right: 1.0),
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                            ),
                                            child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                    icon: const Icon(Icons.phone),
                                                    hintText: 'Enter your phone',
                                                    labelText: 'Phone',
                                                    hintStyle: TextStyle(color: Colors.grey)
                                                ),
                                            ),
                                        )
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey[400],
                                                    blurRadius: 5.0,
                                                    offset: Offset(0, 1)
                                                )
                                            ]
                                        ),
                                        child: Container(
                                            padding: EdgeInsets.only(left: 1.0, right: 1.0),
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                            ),
                                            child: FormField<String>(
                                                builder: (FormFieldState<String> state) {
                                                    return InputDecorator(
                                                        decoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            icon: const Icon(Icons.payment),
                                                            labelText: 'Payment method',
                                                            hintText: 'Enter your payment method',
                                                            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                                        ),
                                                        isEmpty: _currentSelectedValue == '',
                                                        child: DropdownButtonHideUnderline(
                                                            child: DropdownButton<String>(
                                                                hint: _currentSelectedValue == null ? Text('Dropdown') : Text(_currentSelectedValue),
                                                                isDense: true,
                                                                onChanged: (String newValue) {
                                                                    setState(() {
                                                                        _currentSelectedValue = newValue;
                                                                        state.didChange(newValue);
                                                                    });
                                                                },
                                                                items: _currencies.map((String value) {
                                                                    return new DropdownMenuItem<String>(
                                                                        value: value,
                                                                        child: new Text(value),
                                                                    );
                                                                }).toList(),
                                                            )
                                                        ),
                                                    );
                                                },
                                            )
                                        )
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey[400],
                                                    blurRadius: 5.0,
                                                    offset: Offset(0, 1)
                                                )
                                            ]
                                        ),
                                        child: Container(
                                            padding: EdgeInsets.only(left: 1.0, right: 1.0),
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                            ),
                                            child: FormField(
                                                builder: (FormFieldState state) {
                                                    return InputDecorator(
                                                        decoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            icon: const Icon(Icons.add_shopping_cart),
                                                            labelText: 'Add Products',
                                                            hintText: 'Enter your products',
                                                            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                                        ),
                                                        //isEmpty: _product == '',
                                                        child: DropdownButtonHideUnderline(
                                                            child: DropdownButton(
                                                                hint: _product["id"] == null ? Text('Dropdown') : Text("${_product["name"]} ${_product["cost"]}"),
                                                                isDense: true,
                                                                onChanged: (newValue) {
                                                                    setState(() {
                                                                        _product = newValue;
                                                                        state.didChange(newValue);
                                                                    });
                                                                },
                                                                items: _products.map((map) =>
                                                                    DropdownMenuItem(
                                                                        child: Text("${map["name"]} ${map["cost"]}"),
                                                                        value: map,
                                                                    ),
                                                                ).toList(),
                                                            )
                                                        ),
                                                    );
                                                },
                                            ),
                                        )
                                    ),
                                ],
                            ), // this doesn't work for top and bottom
                        )
                    ),SingleChildScrollView(
                        child: RaisedButton(
                            splashColor: Colors.white.withOpacity(0.25),
                            onPressed: () {
                                guardar();
                            },
                            textColor: Colors.white,
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Text('Guardar', style: TextStyle(fontSize: 20)),
                            ),
                        )
                    ),
                ],
            )
        );
    }

    @override
    Widget build(BuildContext context) {
        // Build a Form widget using the _formKey created above.
        return new SafeArea(
            top: true,
            bottom: true,
            child: form()
        );
    }
}