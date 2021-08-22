import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RotationAnimations(),
            RotationBounceInAnimations(),
            ScaleAnimations(),
            TranslateAnimations(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RotationAnimations extends StatefulWidget {
  const RotationAnimations({Key? key}) : super(key: key);

  @override
  _RotationAnimationsState createState() => _RotationAnimationsState();
}

class _RotationAnimationsState extends State<RotationAnimations> with SingleTickerProviderStateMixin {
  double _angle = 0.0;
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = createRotationAnimation();
    _animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [_rotationAnimationButton()],
    ));
  }

  _rotationAnimationButton() {
    return Transform.rotate(
      angle: _angle,
      child: ElevatedButton(
        child: Text("Rotated button"),
        onPressed: () {
          if (_animation.status == AnimationStatus.completed) {
            _animation.reset();
            _animation.forward();
          }
        },
      ),
    );
  }

  createRotationAnimation() {
    var animation = AnimationController(
      vsync: this,
      debugLabel: "animations demo",
      duration: Duration(seconds: 3),
    );

    animation.addListener(() {
      setState(() {
        _angle = (animation.value * 360.0) * (pi / 180);
      });
    });

    return animation;
  }

  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}

class RotationBounceInAnimations extends StatefulWidget {
  const RotationBounceInAnimations({Key? key}) : super(key: key);

  @override
  _RotationBounceInAnimationsState createState() => _RotationBounceInAnimationsState();
}

class _RotationBounceInAnimationsState extends State<RotationBounceInAnimations> with SingleTickerProviderStateMixin {
  double _angle = 0.0;
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = createBounceInRotationAnimation();
    _animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [_rotationAnimationButton()],
    ));
  }

  _rotationAnimationButton() {
    return Transform.rotate(
      angle: _angle,
      child: ElevatedButton(
        child: Text("Rotated button"),
        onPressed: () {
          if (_animation.status == AnimationStatus.completed) {
            _animation.reset();
            _animation.forward();
          }
        },
      ),
    );
  }

  createBounceInRotationAnimation() {
    var controller = AnimationController(
      vsync: this,
      debugLabel: "animations demo",
      duration: Duration(seconds: 3),
    );

    var animation = controller.drive(CurveTween(
      curve: Curves.bounceIn,
    ));

    animation.addListener(() {
      setState(() {
        _angle = (animation.value * 360.0) * (pi / 180);
      });
    });

    return controller;
  }

  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}

class ScaleAnimations extends StatefulWidget {
  const ScaleAnimations({Key? key}) : super(key: key);

  @override
  _ScaleAnimationsState createState() => _ScaleAnimationsState();
}

class _ScaleAnimationsState extends State<ScaleAnimations> with SingleTickerProviderStateMixin {
  double _scale = 0.0;
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = createScaleAnimation();
    _animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [_scaleAnimationButton()],
    ));
  }

  _scaleAnimationButton() {
    return Transform.scale(
      scale: _scale,
      child: ElevatedButton(
        child: Text("Scaled button"),
        onPressed: () {
          if (_animation.status == AnimationStatus.completed) {
            _animation.reverse();
          } else if (_animation.status == AnimationStatus.dismissed) {
            _animation.forward();
          }
        },
      ),
    );
  }

  createScaleAnimation() {
    var animation = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 2.0,
      debugLabel: "animations demo",
      duration: Duration(seconds: 2),
    );

    animation.addListener(() {
      setState(() {
        _scale = animation.value;
      });
    });

    return animation;
  }

  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}

class TranslateAnimations extends StatefulWidget {
  const TranslateAnimations({Key? key}) : super(key: key);

  @override
  _TranslateAnimationsState createState() => _TranslateAnimationsState();
}

class _TranslateAnimationsState extends State<TranslateAnimations> with SingleTickerProviderStateMixin {
  Offset _offset = Offset.zero;
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = createTranslateAnimation();
    _animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [_translateAnimationButton()],
    ));
  }

  _translateAnimationButton() {
    return Transform.translate(
      offset: _offset,
      child: ElevatedButton(
        child: Text("Translated button"),
        onPressed: () {
          if (_animation.status == AnimationStatus.completed) {
            _animation.reverse();
          } else if (_animation.status == AnimationStatus.dismissed) {
            _animation.forward();
          }
        },
      ),
    );
  }

  createTranslateAnimation() {
    var controller = AnimationController(
      vsync: this,
      debugLabel: "animations demo",
      duration: Duration(seconds: 2),
    );

    var animation = controller.drive(
      Tween<Offset>(
        begin: Offset.zero,
        end: Offset(70, 200),
      ),
    );

    animation.addListener(() {
      setState(() {
        _offset = animation.value;
      });
    });

    return controller;
  }

  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}
