import 'package:flutter/material.dart';
import 'package:flutter_ravepay/flutter_ravepay.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Ravepay ravePay;
  RavepayResult _result;

  void chargeCard() async {
    final RavepayResult result = await ravePay.chargeCard(
      const RavepayConfig(
        amount: 20.0,
        country: "ZA",
        currency: "ZAR",
        email: "nthambelenindivhuwo@gmail.com",
        firstname: "Ndivhu",
        lastname: "Nthambe",
        narration: "Test Payment",
        publicKey: "",
        encryptionKey: "",
        txRef: "ravePay-1234345",
        useAccounts: true,
        useCards: true,
        isStaging: true,
        useSave: true,
        metadata: [
          const RavepayMeta("email", "nthambelenindivhuwo@gmail.com"),
          const RavepayMeta("id", "1994"),
        ],
      ),
    );

    setState(() {
      print("Status: ${result.status}");
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    ravePay = Ravepay.of(context);

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Ravepay'),
        ),
        body: new Center(
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  color: Colors.green,
                  onPressed: () => chargeCard(),
                  child: new Text("Make Payment"),
                ),
                SizedBox(
                  height: 16.0,
                ),
                _result != null ? new Text('Payment Status ${_result?.status ?? ""}') : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
