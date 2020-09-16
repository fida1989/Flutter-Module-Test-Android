import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Module Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Module Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel("demo_channel");
  String text = "Data From Native";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
            ),
            Container(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {
_showNativeView();
              },
              child: Text("Go Back"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _receiveFromHost(MethodCall call) async {
    if (call.method == "fromHostToClient") {
      final String data = call.arguments;
      print(data);
      setState(() {
        text = data;
      });
    }
  }

  Future<void> _showNativeView() async {
    await platform.invokeMethod('show_native',"hello from flutter");
  }

  @override
  void initState() {
    platform.setMethodCallHandler(_receiveFromHost);
    super.initState();
  }
}
