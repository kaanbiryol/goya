import 'package:flutter/widgets.dart';
import 'goya.dart';

class GoyaProvider extends StatefulWidget {
  final Widget child;
  final Widget defaultWidget;
  final String path;

  const GoyaProvider(
      {Key key, @required this.path, @required this.child, this.defaultWidget})
      : super(key: key);

  @override
  _GoyaProviderState createState() => _GoyaProviderState();
}

class _GoyaProviderState extends State<GoyaProvider> {
  Future goyaInitializer;

  @override
  void reassemble() {
    super.reassemble();
    goyaInitializer = Goya.initialize(context, widget.path);
  }

  @override
  void initState() {
    super.initState();
    goyaInitializer = Goya.initialize(context, widget.path);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: goyaInitializer,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return widget.child;
            break;
          default:
            return widget.defaultWidget ?? Container();
        }
      },
    );
  }
}
