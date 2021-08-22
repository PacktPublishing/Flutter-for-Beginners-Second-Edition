// Setup Firebase configuration before enabling
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
*/
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:package_info/package_info.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Setup Firebase configuration before enabling
  /*
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Setup Firebase configuration before enabling
  /*
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);
  */

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Setup Firebase configuration before enabling
      //navigatorObservers: <NavigatorObserver>[observer],
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
  RewardedAd? _myRewarded;
  String? _version;

  // Setup Firebase configuration before enabling
  /*
   FirebaseAuth auth = FirebaseAuth.instance;
   final _reference = FirebaseDatabase.instance.reference();
   FirebaseFirestore _firestore = FirebaseFirestore.instance;
  */

  @override
  void initState() {
    // Setup Firebase configuration before enabling
    /*
    MyApp.observer.analytics.logAppOpen();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // User signed-out
      } else {
        // User signed-in
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      print('on message $msg');
    });
    */

    super.initState();
  }

  void _signIn() async {
    // Setup Firebase configuration before enabling
    /*
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: "tom.bailey@example.com", password: "WeLoveFlutter!");

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e, stackTrace) {
      if (e.code == 'user-not-found') {
        // User not found by Firebase
      } else if (e.code == 'wrong-password') {
        // Incorrect password
      }
      _recordCrash(e, stackTrace);
    }
    */
  }

  void _updateRealtimeDatabase() async {
    // Setup Firebase configuration before enabling
    /*
    await _reference.child('messages/a3bdj2/deleted').set(true);
    */
  }

  void _updateFirestore() async {
    // Setup Firebase configuration before enabling
    /*
    await _firestore.doc('messages/a3bdj2').update({"deleted": true});
    */
  }

  void _recordCrash(Exception e, StackTrace stackTrace) async {
    // Setup Firebase configuration before enabling
    /*
    await FirebaseCrashlytics.instance.recordError(e, stackTrace, reason: 'bad times', fatal: true); // or false for non-fatal crashes
    */
  }

  void _loadAdvert() async {
    await RewardedAd.load(
      adUnitId: "AdUnitId",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdFailedToLoad: (LoadAdError error) async {
          print("Failed to load ad ${error.message}");
        },
        onAdLoaded: (RewardedAd ad) {
          _myRewarded = ad;
          _listenOnAdvert();
        },
      ),
    );
  }

  void _listenOnAdvert() {
    _myRewarded!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdShowedFullScreenContent');
      },
      onAdDismissedFullScreenContent: (RewardedAd ad) async {
        print('$ad onAdDismissedFullScreenContent');
        await ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) async {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        await ad.dispose();
      },
    );
  }

  void _showAdvert() {
    _myRewarded!.show(
      onUserEarnedReward: (RewardedAd ad, RewardItem rewardItem) {
        print('$ad onUserEarnedReward $rewardItem');
      },
    );
  }

  void _callCloudFunction() async {
    // Setup Firebase configuration before enabling
    /*
    final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('storeReward', options: HttpsCallableOptions(timeout: Duration(seconds: 30)));
    try {
      await callable.call({
        "email": "email",
        "reward": 30,
      });
    } catch (errorMessage) {
      print(errorMessage);
    }
    */
  }

  void _qrCode() {
    QrImage(
      data: "Whitby",
      version: QrVersions.auto,
      size: 200.0,
    );
  }

  void _launchURL(url) async => await canLaunch(url) ? await launch(url) : print('Failed to launch $url');

  void _googleMaps() async {
    final places = GoogleMapsPlaces(apiKey: "__API_KEY__");
    PlacesDetailsResponse placeDetailsResponse = await places.getDetailsByPlaceId("_placeId");
    PlaceDetails placeDetails = placeDetailsResponse.result;
    Widget mapWidget = GoogleMap(
      mapType: MapType.hybrid,
      markers: {
        Marker(
            position: LatLng(
              placeDetails.geometry?.location.lat ?? 0,
              placeDetails.geometry?.location.lng ?? 0,
            ),
            markerId: MarkerId(placeDetails.placeId))
      },
      initialCameraPosition: CameraPosition(
        zoom: 15,
        target: LatLng(
          placeDetails.geometry?.location.lat ?? 0,
          placeDetails.geometry?.location.lng ?? 0,
        ),
      ),
    );
  }

  void _sharedPreferences(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
  }

  _initialiseVersionInfo() async {
    PackageInfo _packageInfo = await PackageInfo.fromPlatform();
    String version = "${_packageInfo.version}-${_packageInfo.buildNumber}";
    setState(() {
      _version = version;
    });
  }

  _initialiseDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (defaultTargetPlatform == TargetPlatform.windows) {
      WindowsDeviceInfo info = await deviceInfo.windowsInfo;
      print("Computer name ${info.computerName}");
    } // and other platforms...
  }

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
