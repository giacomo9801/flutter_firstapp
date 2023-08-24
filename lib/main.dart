import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firstapp/app.dart';

void main() {

  //per settare l'orientamento della schermata, no landscape
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const App());
}
