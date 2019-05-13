import 'package:bloc/bloc.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:weather/router/application.dart';
import 'package:weather/router/routers.dart';
import 'package:weather/bloc/blocs.dart';

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      onGenerateRoute: Application.router.generator,
    );

    return app;
  }
}

void main() async {
  // 让Bloc执行 SimpleBlocDelegate
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(new MyApp());
}
