import 'package:flutter/material.dart';

import 'app_setup/app_setup.dart';
import 'features/angry_user_feature/angry_user_controller.dart';
import 'features/angry_user_feature/models/angry_event_model.dart';

void main() async {
  ///register  services and init actions
  WidgetsFlutterBinding.ensureInitialized();
  await appSetup.setup();
  appSetup.serviceLocator<AngryUserController>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) {
        appSetup.serviceLocator<AngryUserController>().addUserClicked.call(AngryEventModel(details));
      },
      behavior: HitTestBehavior.translucent,
      child: MaterialApp(
        title: 'Angry user demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      ++_counter;
    });
  }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
