import 'dart:convert';

import 'package:http/http.dart';

class HttpProvider {
  static final HttpProvider _httpProvider = new HttpProvider();

  static HttpProvider get() {
    return _httpProvider;
  }

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

  guardar(ip, request) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var url = 'http://'+ip+':8989/api/payment';
    var response = await post(url, body:  json.encode(request), headers: headers);
    var data = jsonDecode(response.body);
    return data;
  }
}