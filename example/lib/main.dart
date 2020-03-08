import 'package:example/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:goya/goya.dart';
import 'keys.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoyaProvider(
          path: "assets/goya.yaml", child: MyHomePage(title: 'Goya Demo')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            CustomWidget()
                .goya(key: Keys.custom, builder: CustomWidgetGoyaBuilder()),
            Container(
              child: Text("Goya").goya(key: Keys.text),
              height: 200,
              width: 200,
            ).goya(key: Keys.container)
          ],
        ),
      ),
    );
  }
}
