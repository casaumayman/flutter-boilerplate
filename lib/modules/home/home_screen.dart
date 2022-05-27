import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("This is Json data"),
          OutlinedButton(
              onPressed: () async {
                const platform = MethodChannel('scan_NFC');
                final String res =
                    await platform.invokeMethod("getNFCUserInfo", true);
                print(res);
              },
              child: Text(
                "Test NFC",
                style: TextStyle(fontSize: 20),
              ))
        ],
        mainAxisSize: MainAxisSize.min,
      )),
    );
  }
}
